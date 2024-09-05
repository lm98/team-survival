class_name PlayerTeam extends Area2D

@export var spawn_points: Array[Node2D]
@onready var spawning_shape = %SpawningShape

const team_members = {
	"Knight": preload("res://scenes/player/knight.tscn"),
	"FighterRed": preload("res://scenes/player/fighter_red.tscn")
}

var members: Dictionary = {}
var spawn_map: Dictionary = {}

func get_members() -> Dictionary:
	return members.duplicate()

func add_member(member: TeamMember) -> bool:
	if members.size() < spawn_points.size():
		var sp: Node2D = spawn_points[members.size()]
		members[sp] = member
		return true
	else:
		return false

func remove_member_by_spawn_pont(sp: Node2D) -> bool:
	spawn_map[sp] = false
	return members.erase(sp)

func remove_member(member: TeamMember):
	var sp = members.find_key(member)
	if sp != null:
		remove_member_by_spawn_pont(sp)

func spawn_new_member(member_res: Resource, spawn_point: Node2D):
	if members.size() >= spawn_points.size(): return
	var member = member_res.instantiate()
	member.global_position = spawn_point.position
	member.connect("member_died", on_member_death)
	spawn_map[spawn_point] = true
	add_child(member)
	add_member(member)

func spawn(member_res: Resource):
	var sp = spawn_map.find_key(false)
	if sp == null: return
	spawn_new_member(member_res, sp)

func create_test_team():
	var member_prefabs = team_members.values()
	
	for sp in spawn_points:
		var member = member_prefabs.pick_random()
		spawn_new_member(member, sp)

func _ready():
	for sp in spawn_points:
		spawn_map[sp] = false
	#create_test_team()
	spawn_new_member(team_members.values().pick_random(), spawn_points[0])

func _physics_process(_delta: float):
	if Input.is_action_just_pressed("left_mouse_click"):
		spawning_shape.global_position = get_global_mouse_position()
		var i = 0
		for m in members.values():
			var sp = spawn_points[i]
			m.move_to_target(sp.global_position)
			if i < spawn_points.size():
				i += 1
			else:
				break
				
func on_member_death(member: TeamMember):
	remove_member(member)
	
func on_chest_open(member: String) -> void:
	print("Adding " + member)
	spawn(team_members[member])

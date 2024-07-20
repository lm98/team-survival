class_name PlayerTeam extends Area2D

@export var spawn_points: Array[Node2D]
@onready var spawning_shape = %SpawningShape

var members: Dictionary = {}

func get_members() -> Dictionary:
	return members.duplicate()

func add_member(member: TeamMember):
	if members.size() < spawn_points.size():
		members[members.size()] = member

func remove_member_by_index(index: int) -> bool:
	return members.erase(index)

func remove_member(member: TeamMember):
	var index = members.find_key(member)
	if index != null:
		remove_member_by_index(index)

func spawn_new_member(member_res: Resource, position: Vector2 = Vector2.ZERO):
	var member = member_res.instantiate()
	member.global_position = position
	member.connect("member_died", on_member_death)
	add_child(member)
	add_member(member)

func create_test_team():
	const TEST_PLAYER = preload("res://scenes/team_member.tscn")
	for sp in spawn_points:
		spawn_new_member(TEST_PLAYER, sp.global_position)

func _ready():
	create_test_team()

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

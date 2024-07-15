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
	if members.has(member):
		var index = members.find_key(member)
		remove_member_by_index(index)

func create_test_team():
	var p1 = %"TestPlayer-1"
	var p2 = %"TestPlayer-2"
	var p3 = %"TestPlayer-3"
	var p4 = %"TestPlayer-4"
	var p5 = %"TestPlayer-5"
	
	add_member(p1)
	add_member(p2)
	add_member(p3)
	add_member(p4)
	add_member(p5)

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

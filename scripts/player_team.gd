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

func create_test_team():
	const TEST_PLAYER = preload("res://scenes/team_member.tscn")
	var p1 = TEST_PLAYER.instantiate()
	p1.global_position = spawn_points[0].global_position
	p1.connect("member_died", on_member_death)
	add_child(p1)
	var p2 = TEST_PLAYER.instantiate()
	p2.global_position = spawn_points[1].global_position
	p2.connect("member_died", on_member_death)
	add_child(p2)
	var p3 = TEST_PLAYER.instantiate()
	p3.global_position = spawn_points[2].global_position
	p3.connect("member_died", on_member_death)
	add_child(p3)
	var p4 = TEST_PLAYER.instantiate()
	p4.global_position = spawn_points[3].global_position
	p4.connect("member_died", on_member_death)
	add_child(p4)
	var p5 = TEST_PLAYER.instantiate()
	p5.global_position = spawn_points[4].global_position
	p5.connect("member_died", on_member_death)
	add_child(p5)
	
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
				
func on_member_death(member: TeamMember):
	remove_member(member)

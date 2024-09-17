class_name PlayerTeam extends Area2D

@export var team_members: Array[PlayerCharacter]

var members: Array[TeamMember] = []

func _ready():
	spawn_new_member(team_members.pick_random(), global_position)

func _physics_process(_delta: float):
	if Input.is_action_just_pressed("left_mouse_click"):
		for m in members:
			m.move_to_target(get_global_mouse_position())

func get_members() -> Array:
	return Array(members)

func spawn_new_member(member_res: PlayerCharacter, pos: Vector2):
	var member = member_res.scene.instantiate()
	member.connect("member_died", on_member_death)
	add_child(member)
	member.global_position = pos
	members.append(member)

func remove_member(member: TeamMember):
	members.erase(member)

func on_member_death(member: TeamMember):
	remove_member(member)
	pass

func on_chest_open(member: PlayerCharacter, position: Vector2) -> void:
	spawn_new_member(member, position)

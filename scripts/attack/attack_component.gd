extends Node2D

enum AttackType {Aoe, Targeted}
@export var attack_res: PackedScene
@export var attack_type: AttackType

@onready var attack_range: Area2D = $AttackRange


func _on_timer_timeout() -> void:
	match attack_type:
		AttackType.Aoe:
			var attack = attack_res.instantiate()
			add_child(attack)
			attack.global_position = global_position
		AttackType.Targeted:
			var target = find_target()
			if target == null:
				return
			var attack = attack_res.instantiate()
			add_child(attack)
			attack.global_position = global_position
			attack.look_at(target.global_position)

func find_target() -> Node2D:
	return attack_range.get_overlapping_areas().pick_random()

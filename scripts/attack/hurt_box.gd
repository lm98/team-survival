class_name HurtBox extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var disable_timer: Timer = $DisableTimer

func _physics_process(delta: float) -> void:
	var damages: Array = get_overlapping_areas().map(func(hb: HitBox): return hb.damage)
	if not damages.is_empty():
		if owner.has_method("take_damage"):
			for dmg in damages:
				owner.take_damage(dmg)
			disable_hurtbox()

func _on_disable_timer_timeout() -> void:
	collision_shape.set_deferred("disabled", false)

func disable_hurtbox() -> void:
	collision_shape.set_deferred("disabled", true)
	disable_timer.start()

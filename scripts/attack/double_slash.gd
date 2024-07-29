extends Area2D

@export var damage = 50
@onready var attack_animation = $AttackAnimation


func _on_area_entered(area):
	if area.has_method("take_damage"):
		attack_animation.play("default")
		area.take_damage(damage)
		queue_free()


class_name HitBox extends Area2D

@export var damage: float = 50.0

func _init():
	collision_layer = 2
	collision_mask = 0

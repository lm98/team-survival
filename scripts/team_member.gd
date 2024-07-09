extends CharacterBody2D

@export var speed: int = 50
var click_position: Vector2 = global_position
var target_position: Vector2 = global_position

func _physics_process(_delta):
	velocity = target_position * speed
	move_and_slide()

func move_to_target(target: Vector2):
	target_position = (target - global_position).normalized()

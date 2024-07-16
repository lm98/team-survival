class_name TeamMember extends CharacterBody2D

signal member_died(member)
@export var speed: int = 50
var click_position: Vector2 = global_position
var target_position: Vector2 = global_position
@onready var health_component = $HealthComponent

func _physics_process(_delta):
	target_position = (click_position - global_position).normalized()
	velocity = target_position * speed
	move_and_slide()

func move_to_target(target: Vector2):
	click_position = target

func _on_health_component_health_depleted():
	member_died.emit(self)
	queue_free()

func _on_hurt_box_body_entered(body):
	health_component.take_damage(10)

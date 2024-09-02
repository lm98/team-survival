class_name TeamMember extends CharacterBody2D

signal member_died(member: TeamMember)
@export var speed: int = 50
@onready var click_position: Vector2 = global_position
@onready var target_position: Vector2 = global_position
@onready var health_component = $HealthComponent
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(_delta):
	target_position = (click_position - global_position).normalized()
	velocity = target_position * speed
	
	if velocity.length() > 5.0:
		animated_sprite.play("move")
	else:
		animated_sprite.play("idle")
	
	move_and_slide()

func move_to_target(target: Vector2):
	click_position = target

func _on_health_component_health_depleted():
	member_died.emit(self)
	queue_free()

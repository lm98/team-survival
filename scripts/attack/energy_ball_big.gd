extends CharacterBody2D

@export var speed: int = 80
@export var range: int = 100
@onready var animated_sprite_2d = $AnimatedSprite2D

var travelled_distance = 0

func _ready():
	animated_sprite_2d.play("start")

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance > range:
		queue_free()

func setup_attack(enemy_hurtbox: HurtBox):
	look_at(enemy_hurtbox.global_position)

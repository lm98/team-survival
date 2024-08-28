@tool class_name HealthComponent extends Node2D

signal health_depleted
@export var health: int = 100
@onready var health_bar = $HealthBar

func _physics_process(delta: float) -> void:
	if health <= 0:
		health_depleted.emit()

func set_health(new_amount: int):
	health = new_amount
	health_bar.value = health
	if health <= 0:
		health_depleted.emit()
	
func gain_life(amount: int):
	set_health(health + amount)
	
func take_damage(amount: int):
	set_health(health - amount)

func _ready():
	health_bar.max_value = health
	health_bar.value = health

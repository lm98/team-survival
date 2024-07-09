extends Area2D

@onready var spawn_point_1 = $"SpawningShape/SpawnPoint-1"
@onready var spawn_point_2 = $"SpawningShape/SpawnPoint-2"
@onready var spawn_point_3 = $"SpawningShape/SpawnPoint-3"
@onready var spawn_point_4 = $"SpawningShape/SpawnPoint-4"
@onready var spawn_point_5 = $"SpawningShape/SpawnPoint-5"


func _physics_process(_delta: float):
	if Input.is_action_just_pressed("left_mouse_click"):
		pass

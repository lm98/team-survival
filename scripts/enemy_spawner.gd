extends Node2D

@export var spawn_infos: Array[SpawnInfo] = []
@onready var spawn_position_pointer = %SpawnPositionPointer
var time = 0

func _on_timer_timeout():
	time += 1
	for si in spawn_infos:
		if time >= si.time_start and time <= si.time_end:
			if si.spawn_delay_counter <= si.spawn_delay:
				si.spawn_delay_counter += 1
			else:
				si.spawn_delay_counter = 0
				var count = 0
				while count < si.enemy_number:
					print("Spawning Enemy")
					var enemy = si.enemy_res.instantiate()
					enemy.global_position = get_random_position()
					add_child(enemy)
					count += 1

func get_random_position() -> Vector2:
	spawn_position_pointer.progress_ratio = randf()
	return spawn_position_pointer.global_position

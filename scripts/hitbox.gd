class_name Hitbox extends Area2D

signal enemy_entered(enemy)

func _on_area_entered(area):
	print("enemy in range!")
	enemy_entered.emit(area)

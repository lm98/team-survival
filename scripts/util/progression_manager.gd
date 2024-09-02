class_name ProgressionManager extends Node

@export var points: int = 0

func increase_points(amount: int) -> void:
	points += amount
	print("Points increased!")

func decrease_points(amount: int) -> void:
	if (points - amount) <= 0:
		points = 0
	else:
		points -= amount

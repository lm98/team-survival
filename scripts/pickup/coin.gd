extends Area2D

@export var value: int = 10

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var pm: ProgressionManager = get_node("/root/Game/ProgressionManager")

func _on_body_entered(body: Node2D) -> void:
	pm.increase_points(value)
	animation_player.play("pickup")

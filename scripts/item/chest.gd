@tool class_name Chest extends Area2D

@export var price_to_open: int = 0
@export var content: PlayerCharacter

@onready var label: Label = $Label
@onready var pm: ProgressionManager = get_node("/root/Game/ProgressionManager")
@onready var pt: PlayerTeam = get_node("/root/Game/PlayerTeam")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	if pm == null:
		printerr("No Progression Manager!")
	elif pt == null:
		printerr("No Player Team!")

func _physics_process(delta: float) -> void:
	label.text = str(price_to_open)
	
	var player_present: bool = get_overlapping_bodies().size() > 0
	
	if player_present and pm.points >= price_to_open and Input.is_action_just_pressed("open_chest"):
		pt.on_chest_open(content, global_position)
		animated_sprite_2d.play("open")

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()

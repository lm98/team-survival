extends Node

@onready var choose_menu: Control = $ChooseMenu
var choose_menu_visible: bool = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("open_choose_menu"):
		toggle_choose_menu()

func toggle_choose_menu() -> void:
	choose_menu_visible = !choose_menu_visible
	choose_menu.visible = choose_menu_visible

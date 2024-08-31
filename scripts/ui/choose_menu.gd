extends Control

@onready var choice_1 = %Choice1
@onready var choice_2 = %Choice2
@onready var choice_3 = %Choice3

@export var ch_1 = "Q"
@export var ch_2 = "W"
@export var ch_3 = "E"

func set_choice(n, choice):
	match n:
		1:
			choice_1.text = "Q:" + choice
			ch_1 = choice
		2:
			choice_2.text = "W:" + choice
			ch_2 = choice
		3:
			choice_3.text = "E:" + choice
			ch_3 = choice

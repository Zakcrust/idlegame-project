extends Node

signal show_message(message, status)
signal show_pop_up(message)
signal quit_pop_up()

signal show_general_pop_up(message, callback)

signal hide_input_mask(value)

signal reset_game()

func _ready():
	connect("reset_game", SaveManager, "reset_default_data")

extends Node

var fsm
var animator

func enter() -> void:
	animator = get_parent().character.get_node("AnimatedSprite")
	animator.play("idle")

func next(new_state) -> void:
	fsm.change_to(new_state)

func process(delta) -> void:
	pass

func physics_process(delta) -> void:
	pass

func input(event) -> void:
	pass
	
func unhandled_input(event):
	pass

func unhandled_key_input(event):
	pass



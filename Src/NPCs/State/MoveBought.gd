extends Node

var fsm
var animator

func enter() -> void:
	animator = get_parent().character.get_node("AnimatedSprite")
	animator.play("walk_bought")

func next(new_state) -> void:
	fsm.change_to(new_state)

func process(delta) -> void:
	get_parent().character.global_position += get_parent().character.speed * get_parent().character.init_direction * delta

func physics_process(delta) -> void:
	pass

func input(event) -> void:
	pass
	
func unhandled_input(event):
	pass

func unhandled_key_input(event):
	pass



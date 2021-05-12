extends Node

var state : Object
var history = []

var character
const DEBUG = false

var fsm
var active_shops
var action_done = false

func enter():
	character = get_parent().get_parent()
	active_shops = GameReducer.get_active_shop()
	state = get_child(0)
	_enter_state()

func next(new_state) -> void:
	fsm.change_to(new_state)

func change_to(new_state) -> void:
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()


func back():
	if history.size() > 0:
		state = get_node(history.pop_back())
		_enter_state()

func _enter_state():
	if DEBUG:
		print("Entering state: ", state.name)
	# Give the new state a reference to this state machine script
	state.fsm = self
	state.enter()
	
	
func queue_check() -> void:
	if character.get_node("Raycast").is_colliding():
		var node = character.get_node("Raycast").get_collider()
		if node.is_in_group("NPC"):
			if node.role == character.role and node.init_direction == character.init_direction:
				change_to("Idle")
	else:
		change_to("Move")

func check_game_shop() -> void:
	if not action_done and character.global_position.distance_to(active_shops.global_position) < 90:
		change_to("Idle")
		yield(get_tree().create_timer(3.0),"timeout")
		action_done = true
		change_to("Move")
		

func process(delta):
	queue_check()
	check_game_shop()
	if state.has_method("process"):
		state.process(delta)

func physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)

func input(event):
	if state.has_method("input"):
		state.input(event)

func unhandled_input(event):
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)

func unhandled_key_input(event):
	if state.has_method("unhandled_key_input"):
		state.unhandled_key_input(event)

#func notification(what):
#	if state && state.has_method("notification"):
#		state.notification(what)

extends Node

var state : Object
var history = []

var character
const DEBUG = false

var fsm

func enter():
	character = get_parent().get_parent()
	character.global_position.y += 40
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


# Route Game Loop function calls to
# current state handler method if it exists
func process(delta):
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

#func _notification(what):
#	if state && state.has_method("notification"):
#		state.notification(what)

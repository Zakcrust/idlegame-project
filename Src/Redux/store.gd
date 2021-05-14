extends Node

var _state = {}
var _reducers = {}

signal state_changed(reducer_name, state)

func create(reducers, callbacks = null):
	for reducer in reducers:
		var reducer_name = reducer['name']
		if not _state.has(reducer_name):
			_state[reducer_name] = {}
		if not _reducers.has(reducer_name):
			_reducers[reducer_name] = funcref(reducer['instance'], reducer_name)
			var initial_state = _reducers[reducer_name].call_func(
				_state[reducer_name],
				{'type': null}
			)
			_state[reducer_name] = initial_state

	if callbacks != null:
		for callback in callbacks:
			subscribe(callback['instance'], callback['name'])

func subscribe(target, method):
	connect('state_changed', target, method)

func unsubscribe(target, method):
	disconnect('state_changed', target, method)

func dispatch(action):
	for reducer_name in _reducers.keys():
		var state = _state[reducer_name]
		var next_state = _reducers[reducer_name].call_func(state, action)
		if next_state == null:
			_state.erase(reducer_name)
			emit_signal('state_changed', reducer_name, null)
		elif state != next_state:
			_state[reducer_name] = next_state
			emit_signal('state_changed', reducer_name, next_state)

func get_state():
	return _state

func shallow_copy(dict):
	return shallow_merge(dict, {})

func shallow_merge(src_dict, dest_dict):
	for i in src_dict.keys():
		dest_dict[i] = src_dict[i]
	return dest_dict


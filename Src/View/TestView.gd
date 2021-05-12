extends Node2D

var tap_scene : PackedScene = preload("res://Src/Tap/Tap.tscn")


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			generate_coins(event.global_position)


func generate_coins(coin_pos : Vector2) -> void:
	var tap = tap_scene.instance()
	tap.global_position = coin_pos
	tap.init("1")
	add_child(tap)
	

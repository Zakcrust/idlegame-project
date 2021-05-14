extends Node2D

var npc_scene : PackedScene = preload("res://Src/NPCs/NPC1.tscn")

export (float) var spawn_wait_time = 1.0

func _ready():
	$Timer.wait_time = spawn_wait_time
	$Timer.start()

func _on_Timer_timeout():
	npc_spawn()

func npc_spawn() -> void:
	get_parent().add_child(npc_scene.instance())

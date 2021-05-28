extends Node2D
var chosen_npc : PackedScene


var npc_scenes : Array = [
	preload("res://Src/NPCs/NPC1.tscn"),
	preload("res://Src/NPCs/NPC2.tscn"),
	preload("res://Src/NPCs/NPC3.tscn")
]

export (float) var spawn_wait_time = 1.0

func _ready():
	randomize()
	$Timer.wait_time = spawn_wait_time
	$Timer.start()

func _on_Timer_timeout():
	npc_spawn()

func npc_spawn() -> void:
	npc_scenes.shuffle()
	chosen_npc = npc_scenes.front()
	get_parent().add_child(chosen_npc.instance())

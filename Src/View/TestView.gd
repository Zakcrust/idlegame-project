extends Node2D

var tap_scene : PackedScene = preload("res://Src/Tap/Tap.tscn")

var registered_tap : int = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			generate_coins(event.position)
			registered_tap += 1


func generate_coins(coin_pos : Vector2) -> void:
	var tap = tap_scene.instance()
	tap.global_position = coin_pos
	tap.init("1")
	add_child(tap)
	


func _on_TPSCounter_timeout():
	var TPM  = registered_tap * 60
	print("registered_tap_per_minute : %s" % TPM)
	registered_tap = 0
	
	var npc_to_spawn = TPM / 60
	spawn_extra_npc(npc_to_spawn)
	


func spawn_extra_npc(amount) -> void:
	for x in range(0, amount):
		$YSort/NPCSpawner.npc_spawn()
		yield(get_tree().create_timer(0.1), "timeout")

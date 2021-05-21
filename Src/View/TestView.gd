extends Node2D

var tap_scene : PackedScene = preload("res://Src/Components/Tap/Tap.tscn")

var registered_tap : int = 0

var tap_value : int  = 0
var idle_income : int = 1
var money : int

func _ready():
	tap_value = DataManager.get_tap_value()
	idle_income = DataManager.get_idle_value()
	money = DataManager.get_money()
	DataManager.connect("idle_value_changed", self, "set_idle_income")
	DataManager.connect("tap_value_changed", self, "set_tap_income")
	
	if ConfigManager.is_bgm_on():
		SoundManager.resume_bgm()
	else:
		SoundManager.pause_bgm()

func set_tap_income(value) -> void:
	tap_value = value


func set_idle_income(value) -> void:
	idle_income = value

func _input(event):
	if event is InputEventMouseButton and DataManager.can_tap:
			if event.pressed:
				if event.position.y > 300 and event.position.y < 1200:
					generate_coins(event.position)
					registered_tap += 1

func update_money(value) -> void:
	pass


func generate_coins(coin_pos : Vector2) -> void:
	var tap = tap_scene.instance()
	tap.global_position = coin_pos
	tap.init(str(tap_value))
	money = DataManager.get_money()
	money += tap_value
	DataManager.set_money(money)
	add_child(tap)


func _on_TPSCounter_timeout():
	var TPM  = registered_tap * 60
	registered_tap = 0
	
	var npc_to_spawn = TPM / 60
	var IPM = (TPM * tap_value) + (idle_income * 12)
	DataManager.set_ipm(IPM)
	spawn_extra_npc(npc_to_spawn)


func spawn_extra_npc(amount) -> void:
	for x in range(0, amount):
		$YSort/NPCSpawner.npc_spawn()
		yield(get_tree().create_timer(0.1), "timeout")


func _on_IdleTimer_timeout():
	var idle_money = DataManager.get_money()
	idle_money += idle_income
	DataManager.set_money(idle_money)

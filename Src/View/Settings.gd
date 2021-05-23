extends CanvasLayer

onready var control = $Control
onready var sfx = $Control/VBoxContainer/Sfx
onready var bgm = $Control/VBoxContainer/Bgm
onready var reset_data = $Control/VBoxContainer/ResetData


func _ready():
	update_button_modulate_state()


func _on_Sfx_pressed():
	SoundManager.toggle_sfx()
	SoundManager.play_sfx("click")
	update_button_modulate_state()


func _on_Bgm_pressed():
	SoundManager.toggle_bgm()
	SoundManager.play_sfx("click")
	update_button_modulate_state()


func _on_ResetData_pressed():
	SoundManager.play_sfx("click")
	EventManager.emit_signal("show_general_pop_up", "All saved progress will be lost!", "reset_game")

	pass


func _on_Back_pressed():
	control.visible = false
	SoundManager.play_sfx("click")
	DataManager.can_tap = true


func update_button_modulate_state():
	sfx.modulate = "ffffff" if SoundManager.is_sfx_on() else "d6d6d6"
	bgm.modulate = "ffffff" if SoundManager.is_bgm_on() else "d6d6d6"


func display():
	control.visible = true

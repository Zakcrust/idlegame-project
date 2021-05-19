extends CanvasLayer

onready var control = $Control
onready var sfx = $Control/VBoxContainer/Sfx
onready var bgm = $Control/VBoxContainer/Bgm
onready var reset_data = $Control/VBoxContainer/ResetData


func _ready():
	update_button_modulate_state()


func _on_Sfx_pressed():
	ConfigManager.toggle_sfx()
	update_button_modulate_state()


func _on_Bgm_pressed():
	ConfigManager.toggle_bgm()
	update_button_modulate_state()


func _on_ResetData_pressed():
	pass # Replace with function body.


func _on_Back_pressed():
	control.visible = false


func update_button_modulate_state():
	sfx.modulate = "ffffff" if ConfigManager.is_sfx_on() else "d6d6d6"
	bgm.modulate = "ffffff" if ConfigManager.is_bgm_on() else "d6d6d6"


func display():
	control.visible = true

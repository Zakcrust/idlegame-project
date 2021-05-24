extends Popup

func _ready():
	EventManager.connect("show_pop_up", self, "show_pop_up")


func show_pop_up(message) -> void:
	$ColorRect/Label.text = message
	get_tree().paused = true
	popup_centered()


func _on_Button_pressed():
	get_tree().paused = false
	hide()


func _on_Popup_popup_hide():
	get_tree().paused = false

extends Popup

var callback : String

func _ready():
	EventManager.connect("show_general_pop_up", self, "init_pop_up")

func init_pop_up(message : String, callback_signal : String) -> void:
	$Label.text = message
	callback = callback_signal
	popup_centered()
	get_tree().paused = true


func _on_Yes_pressed():
	hide()
	get_tree().paused = false
	EventManager.emit_signal(callback)
	


func _on_No_pressed():
	hide()
	get_tree().paused = false

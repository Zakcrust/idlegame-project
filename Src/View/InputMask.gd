extends ColorRect

func _ready():
	EventManager.connect("hide_input_mask", self, "hide_input_mask")


func hide_input_mask(value : bool) -> void:
	if value:
		hide()
	else:
		show()

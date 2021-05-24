extends Control

func _ready():
	EventManager.connect("show_message", self, "set_message")

func set_message(message, status = "SUCCESS") -> void:
	if status == "ERROR":
		$ColorRect.color = Color.red
	elif status == "SUCCESS":
		$ColorRect.color = Color.green
	
	$Label.text = message
	animate()

func animate() -> void:
	$Tween.interpolate_property(self, "rect_global_position", rect_global_position, rect_global_position + Vector2(0, 100), 1.0)
	$Tween.start()
	yield($Tween, "tween_all_completed")
	yield(get_tree().create_timer(2.0), "timeout")
	$Tween.interpolate_property(self, "rect_global_position", rect_global_position, rect_global_position + Vector2(0, -100), 1.0)
	$Tween.start()

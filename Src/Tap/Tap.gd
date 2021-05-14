extends Node2D

func init(value : String) -> void:
	$Label.text = value

func _ready():
	$Tween.interpolate_property(self, "position", global_position, global_position + Vector2(0, -100),0.5)
	$Tween.interpolate_property(self, "modulate", modulate, Color8(255,255,255,0), 0.5)
	$Tween.start()
	yield($Tween, "tween_all_completed")
	queue_free()

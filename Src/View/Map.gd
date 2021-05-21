extends CanvasLayer


func display():
	$AnimationPlayer.play("display")


func _on_Back_pressed():
	$AnimationPlayer.play("hide")

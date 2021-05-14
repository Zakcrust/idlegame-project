extends CanvasLayer


onready var upgrade_container = $DrawerContainer/VBoxContainer/ScrollContainer/UpgradeContainer
onready var drawer_label = $DrawerContainer/VBoxContainer/TitleContainer/Title


func display_upgrades():
	drawer_label.text = "Upgrade"
	$AnimationPlayer.play("display_drawer")


func display_ingredients():
	drawer_label.text = "Bahan"
	$AnimationPlayer.play("display_drawer")


func hide_drawer():
	$AnimationPlayer.play("hide_drawer")


func _on_Upgrade_pressed():
	display_upgrades()


func _on_Ingredient_pressed():
	display_ingredients()


func _on_Mask_gui_input(event):
	if event is InputEventMouseButton:
		hide_drawer()

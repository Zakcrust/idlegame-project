extends CanvasLayer


onready var upgrade_container = $DrawerContainer/VBoxContainer/ScrollContainer/UpgradeContainer
onready var drawer_label = $DrawerContainer/VBoxContainer/TitleContainer/Title


func display_upgrades():
	drawer_label.text = "Peralatan"
	$AnimationPlayer.play("display_drawer")


func display_ingredients():
	drawer_label.text = "Bahan"
	$AnimationPlayer.play("display_drawer")


func display_shops():
	drawer_label.text = "Toko"
	$AnimationPlayer.play("display_drawer")


func hide_drawer():
	$AnimationPlayer.play("hide_drawer")


func _on_Upgrade_pressed():
	SoundManager.play_sfx("click")
	$DrawerContainer/VBoxContainer/ScrollContainer.show_items("tool")
	display_upgrades()


func _on_Ingredient_pressed():
	SoundManager.play_sfx("click")
	$DrawerContainer/VBoxContainer/ScrollContainer.show_items("ingredient")
	display_ingredients()


func _on_Shop_pressed():
	SoundManager.play_sfx("click")
#	$DrawerContainer/VBoxContainer/ScrollContainer.show_items("shop")
	display_shops()


func _on_Mask_gui_input(event):
	if event is InputEventMouseButton and $Mask.modulate.a8 == 70:
		hide_drawer()

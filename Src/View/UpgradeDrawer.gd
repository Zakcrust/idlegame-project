extends CanvasLayer


onready var upgrade_container = $DrawerContainer/VBoxContainer/ScrollContainer/UpgradeContainer
onready var drawer_label = $DrawerContainer/VBoxContainer/TitleContainer/Title

var upgrade_item_scene = preload("res://Src/Components/ShopItems/UpgradeItem.tscn")


func _ready():
	load_items("tool")
	load_items("ingredient")
	DataManager.connect("item_bought", self, "update_item")


func update_item(status, item) -> void:
	if status == DataStatus.ERROR:
#		EventManager.emit_signal("show_message", "Error has occured", "ERROR")
		EventManager.emit_signal("show_pop_up", "Error has occured")
	elif status == DataStatus.INSUFFICIENT_MONEY:
#		EventManager.emit_signal("show_message", "Insufficient money", "ERROR")
		EventManager.emit_signal("show_pop_up", "Insufficient money")
	elif status == DataStatus.SUCCESS:
		for child in upgrade_container.get_children():
			if child.item_name == item['item_name']:
				child.item_level = item['level']
				child.item_price = item['price']
				child.update_description(item['description'] % item['effect_value'])
				child.update_item_icon()
				if item['level'] >= item['max_level']:
					child.max_buy()
				return


func load_items(group) -> void:
	var shop_instance = DataManager.get_shop_instance()
	var data = DataManager.get_items(group, shop_instance.shop_name)
	var upgrade_item
	for item in data:
		upgrade_item = upgrade_item_scene.instance()
		upgrade_item.set_item(item)
		upgrade_container.add_child(upgrade_item)
		upgrade_item.add_to_group(group)


func show_items(group) -> void:
	for child in upgrade_container.get_children():
		if child.is_in_group(group):
			child.show()
		else:
			child.hide()


func display_upgrades():
	drawer_label.text = "Peralatan"
	$AnimationPlayer.play("display_drawer")
	DataManager.can_tap = false


func display_ingredients():
	drawer_label.text = "Bahan"
	$AnimationPlayer.play("display_drawer")
	DataManager.can_tap = false


func display_shops():
	drawer_label.text = "Toko"
	$AnimationPlayer.play("display_drawer")
	DataManager.can_tap = false


func hide_drawer():
	$AnimationPlayer.play("hide_drawer")
	DataManager.can_tap = true


func _on_Upgrade_pressed():
	SoundManager.play_sfx("click")
	show_items("tool")
	display_upgrades()
	DataManager.can_tap = false


func _on_Ingredient_pressed():
	SoundManager.play_sfx("click")
	show_items("ingredient")
	display_ingredients()
	DataManager.can_tap = false


func _on_Shop_pressed():
	SoundManager.play_sfx("click")
#	show_items("shop")
	display_shops()
	DataManager.can_tap = false


func _on_Mask_gui_input(event):
	if event is InputEventMouseButton and $Mask.modulate.a8 == 70:
		hide_drawer()
		DataManager.can_tap = true

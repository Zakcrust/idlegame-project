extends ColorRect

var item_name : String
var item_level : int setget set_item_level
var item_price : int setget set_item_price


func enable_buy() -> void:
	$HBoxContainer/Buy.disabled = false


func disable_buy() -> void:
	$HBoxContainer/Buy.disabled = true


func max_buy() -> void:
	$HBoxContainer/Buy.disabled = true
	$HBoxContainer/Buy.text = "Max Level"


func set_item(item) -> void:
	item_name = item['item_name']
	item_level = item['level']
	item_price = item['price']
	$HBoxContainer/Labels/Name.text = item_name
	$HBoxContainer/Labels/Level.text = "Level %s" % item_level
	$HBoxContainer/Labels/Price.text = "Rp. %s" % item_price
	update_description(item['description'] % item['effect_value'])
	update_item_icon()
	
	if item['level'] >= item['max_level']:
		max_buy()

func update_description(desc) -> void:
	$HBoxContainer/Labels/Desc.text = desc


func buy_item() -> void:
	SoundManager.play_sfx("coin")
	DataManager.buy_item(item_name)


func set_item_level(value) -> void:
	item_level = value
	$HBoxContainer/Labels/Level.text = "Level %s" % item_level


func set_item_price(value) -> void:
	item_price = value
	$HBoxContainer/Labels/Price.text = "Rp. %s" % item_price


func update_item_icon() -> void:
	var texture_path = AssetDictionary.get_item_texture_path(item_name, item_level)
	$HBoxContainer/Bar/Icon.texture = load(texture_path)


func _on_Buy_pressed():
	buy_item()

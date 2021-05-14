extends Node

signal money_changed(value)
signal item_bought(status, item)
signal item_upgraded(status, item)
signal shop_changed(value)

var data = {
	"currecy" : {
		"money" : 0,
		"tap_value" : 1,
		"idle_value" : 1
	},
	"gui" : {
		"is_loading" : false
	},
	"shop" : {
		"instance" : null,
		"items" : [
			{
				"shop_name" : "",
				"type" : "",
				"item_name" : "1",
				"level" : 1,
				"price" : 100,
				"price_multiplier" : 1.1,
				"unlocked" : false,
				"effect" : "",
				"effect_value" : 1.2,
				"effect_multiplier" : 1.5
			}
		],
		"shops" : {
			"name" : "e"
		}
	}
}

func _ready():
	pass


func set_money(value) -> void:
	data["currency"]["money"] = value
	emit_signal("money_changed", value)

func get_money(value) -> int:
	return data["currency"]["money"]

func set_shop_instance(instance) -> void:
	data['shop']['instance'] = instance
	emit_signal("shop_changed", instance)

func get_shop_instance():
	return data['shop']['instance']

func buy_item(item_name) -> void:
	var selected_item = null
	for item in data['shop']['items']:
		if item['item_name'] == item_name:
			selected_item = item
	if selected_item == null:
		emit_signal("item_bought", DataStatus.ERROR, null)
		return
	if data['currency']['money'] < selected_item['price']:
		emit_signal("item_bought", DataStatus.INSUFFICIENT_MONEY, null)
		return
	data['item_name']['unlocked'] = false
	emit_signal("item_bought", DataStatus.SUCCESS, selected_item)


func upgrade_item(item_name) -> void:
	var selected_item = null
	for item in data['shop']['items']:
		if item['item_name'] == item_name:
			selected_item = item
	if selected_item == null:
		emit_signal("item_upgraded", DataStatus.ERROR, null)
		return
	if data['currency']['money'] < selected_item['price']:
		emit_signal("item_upgraded", DataStatus.INSUFFICIENT_MONEY, null)
		return
	data['item_name']['unlocked'] = false
	emit_signal("item_upgraded", DataStatus.SUCCESS, selected_item)

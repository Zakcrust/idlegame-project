extends Node

class_name ShopItem

c

func _init(p_name : String, p_price : int, p_boost, p_multiplier):
	item_name = p_name
	item_price = p_price
	item_boost = p_boost
	price_multiplier = p_multiplier


func get_item_name() -> String:
	return item_name

func get_item_price() -> int:
	return item_price

func get_item_boost() -> String:
	return item_boost
	
func get_price_multiplier() -> float:
	return price_multiplier

extends Node

var init_data = {
	"active_shop" : null,
}


func set_active_shop(value : Node2D) -> void:
	init_data.active_shop = value

func get_active_shop() -> Node2D:
	return init_data.active_shop

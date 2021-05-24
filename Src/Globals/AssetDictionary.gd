extends Node


const INGREDIENTS = {
	"Daging Ayam" : {
		"1" : "res://Assets/Sprites/Ingredient/ayam_level_1.png",
		"2" : "res://Assets/Sprites/Ingredient/ayam_level_2.png",
		"3" : "res://Assets/Sprites/Ingredient/ayam_level_3.png",
	},
	"Cabe" : {
		"1" : "res://Assets/Sprites/Ingredient/cabe_level_1.png",
		"2" : "res://Assets/Sprites/Ingredient/cabe_level_2.png",
		"3" : "res://Assets/Sprites/Ingredient/cabe_level_3.png",
	},
	"Bawang putih" : {
		"1" : "res://Assets/Sprites/Ingredient/onion_level_1.png",
		"2" : "res://Assets/Sprites/Ingredient/onion_level_2.png",
		"3" : "res://Assets/Sprites/Ingredient/onion_level_3.png",
	}
}

const TOOLS = {
	"Kompor" : {
		"1" : "res://Assets/Sprites/Tool/kompor_level_1.png",
		"2" : "res://Assets/Sprites/Tool/kompor_level_2.png",
		"3" : "res://Assets/Sprites/Tool/kompor_level_3.png",
	},
	"Wajan" : {
		"1" : "res://Assets/Sprites/Tool/wajan_level_1.png",
		"2" : "res://Assets/Sprites/Tool/wajan_level_2.png",
		"3" : "res://Assets/Sprites/Tool/wajan_level_3.png",
	},
	"Spatula" : {
		"1" : "res://Assets/Sprites/Tool/spatula_level_1.png",
		"2" : "res://Assets/Sprites/Tool/spatula_level_2.png",
		"3" : "res://Assets/Sprites/Tool/spatula_level_3.png",
	}
}


func get_item_texture_path(item_name, item_level) -> String:
	var texture_level = "1"
	if item_level >= 4 and item_level <= 6:
		texture_level = "2"
	elif item_level >= 7 and item_level <= 10:
		texture_level = "3"
	
	var item_texture
	if INGREDIENTS.has(item_name):
		item_texture = INGREDIENTS[item_name][texture_level]
	elif TOOLS.has(item_name):
		item_texture = TOOLS[item_name][texture_level]
	return item_texture

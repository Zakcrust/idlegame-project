extends Node

signal money_changed(value)
signal item_bought(status, item)
signal item_upgraded(status, item)
signal shop_changed(value)
signal tap_value_changed(value)
signal idle_value_changed(value)
signal ipm_changed(value)
signal achievement_updated(value)


const ON_TAP_ACHIVEMENT = "ON_TAP_ACHIVEMENT"
const ON_BUY_TOOL_ACHIEVEMENT = "ON_BUY_TOOL_ACHIEVEMENT"
const ON_BUY_FOOD_ACHIEVEMENT = "ON_BUY_FOOD_ACHIEVEMENT"
const ON_UPGRADE_TOOL_ACHIEVEMENT = "ON_UPGRADE_TOOL_ACHIEVEMENT"
const ON_UPGRADE_FOOD_ACHIEVEMENT = "ON_UPGRADE_FOOD_ACHIEVEMENT"
const ON_INCOME_ACHIEVEMENT = "ON_INCOME_ACHIEVEMENT"

var can_tap = true

var default_data = {
	"currency" : {
		"money" : 0,
		"gems" : 0,
		"tap_value" : 1,
		"idle_value" : 1,
		"ipm" : 1
	},
	"gui" : {
		"is_loading" : false
	},
	"shop" : {
		"instance" : null,
		"items" : [
			{
				"item_required" : {
					"name" : "",
					"level" : 0
				},
				"shop_name" : "shop_1",
				"type" : "tool",
				"item_name" : "Kompor",
				"level" : 1,
				"base_price" : 50,
				"price" : 50,
				"price_multiplier" : 1.07,
				"unlocked" : true,
				"effect" : EffectStatus.IDLE_INCOME,
				"effect_value" : 2,
				"effect_multiplier" : 2,
				"max_level" : 10,
				"description" : "pendapatan per menit  +%s koin"
			},
			{
				"item_required" : {
					"name" : "",
					"level" : 0
				},
				"shop_name" : "shop_1",
				"type" : "tool",
				"item_name" : "Wajan",
				"level" : 1,
				"base_price" : 150,
				"price" : 150,
				"price_multiplier" : 1.07,
				"unlocked" : true,
				"effect" : EffectStatus.IDLE_INCOME,
				"effect_value" : 6,
				"effect_multiplier" : 2,
				"max_level" : 10,
				"description" : "pendapatan per menit  +%s koin"
			},
			{
				"item_required" : {
					"name" : "",
					"level" : 0
				},
				"shop_name" : "shop_1",
				"type" : "tool",
				"item_name" : "Spatula",
				"level" : 1,
				"base_price" : 500,
				"price" : 500,
				"price_multiplier" : 1.07,
				"unlocked" : true,
				"effect" : EffectStatus.IDLE_INCOME,
				"effect_value" : 2,
				"effect_multiplier" : 2,
				"max_level" : 10,
				"description" : "pendapatan per menit  +%s koin"
			},
			{
				"item_required" : {
					"name" : "",
					"level" : 0
				},
				"shop_name" : "shop_1",
				"type" : "ingredient",
				"item_name" : "Daging Ayam",
				"level" : 1,
				"base_price" : 50,
				"price" : 50,
				"price_multiplier" : 1.07,
				"unlocked" : true,
				"effect" : EffectStatus.TAP_INCOME,
				"effect_value" : 4,
				"effect_multiplier" : 2,
				"max_level" : 10,
				"description" : "penjualan  +%s koin"
			},
			{
				"item_required" : {
					"name" : "",
					"level" : 0
				},
				"shop_name" : "shop_1",
				"type" : "ingredient",
				"item_name" : "Cabe",
				"level" : 1,
				"base_price" : 150,
				"price" : 150,
				"price_multiplier" : 1.07,
				"unlocked" : true,
				"effect" : EffectStatus.TAP_INCOME,
				"effect_value" : 6,
				"effect_multiplier" : 2,
				"max_level" : 10,
				"description" : "penjualan  +%s koin"
			},
			{
				"item_required" : {
					"name" : "",
					"level" : 0
				},
				"shop_name" : "shop_1",
				"type" : "ingredient",
				"item_name" : "Bawang putih",
				"level" : 1,
				"base_price" : 500,
				"price" : 500,
				"price_multiplier" : 1.07,
				"unlocked" : false,
				"effect" : EffectStatus.TAP_INCOME,
				"effect_value" : 2,
				"effect_multiplier" : 2,
				"max_level" : 10,
				"description" : "penjualan  +%s koin"
			}
		],
		"shops" : [
			{
			"name" : "shop_1"
		},
			{
			"name" : "shop_2"
		},
			{
			"name" : "shop_3"
		},
			{
			"name" : "shop_4"
		},
			{
			"name" : "shop_5"
		}
		]
	},
	"achievements" : [
		{
			"type" : ON_TAP_ACHIVEMENT,
			"name" : "Enterpreuneur",
			"description" : "lakukan tap sebanyak %s kali dalam game." % 100,
			"reward" : 50,
			"value" : 100,
			"unlocked" : false,
			"redeemed" : false
		},
		{
			"type" : ON_BUY_TOOL_ACHIEVEMENT,
			"name" : "Mari memasak",
			"description" : "beli %s peralatan masak." % 3,
			"reward" : 50,
			"value" : 3,
			"unlocked" : false,
			"redeemed" : false
		},
		{
			"type" : ON_UPGRADE_TOOL_ACHIEVEMENT,
			"name" : "Sebuah Peningkatan",
			"description" : "tingkatkan peralatan sebanyak %s kali" % 10,
			"reward" : 50,
			"value" : 10,
			"unlocked" : false,
			"redeemed" : false 
		},
		{
			"type" : ON_BUY_FOOD_ACHIEVEMENT,
			"name" : "Makanan Baru",
			"description" : "beli %s jenis makanan" % 3,
			"reward" : 50,
			"value" : 3,
			"unlocked" : false,
			"redeemed" : false 
		},
		{
			"type" : ON_UPGRADE_FOOD_ACHIEVEMENT,
			"name" : "Kualitas Paling Utama",
			"description" : "tingkatkan makanan sebanyak %s kali" % 10,
			"reward" : 50,
			"value" : 3,
			"unlocked" : false,
			"redeemed" : false 
		}
	],
	"misc" : {
		"total_tap_pressed" : 0,
		"total_income" : 0,
		"tool_bought" : 0,
		"food_bought" : 0,
		"tool_upgraded" : 0,
		"food_upgraded" : 0
	},
	"last_save_timestamp" : 0
}
var data

func add_tap() -> void:
	data['misc']['total_tap_pressed'] += 1

func _ready():
	get_tree().set_auto_accept_quit(false)
	if not data["last_save_timestamp"] == 0:
		calculate_passive_income()
		SaveManager.save_data(data)

func set_price_multiplier(base_price, level) -> float:
	var exponent : float = level * 0.22
	return pow(base_price, exponent) + level - 1


func check_achievement(type : String) -> void:
	for achievement in data['achievements']:
		if achievement['type'] == type and not achievement['unlocked'] and not achievement['redeemed']:
			print(achievement['value'])
			match(type):
				ON_TAP_ACHIVEMENT:
					if data['misc']['total_tap_pressed'] >= achievement['value']:
						achievement['unlocked'] = true
				ON_BUY_FOOD_ACHIEVEMENT:
					if data['misc']['food_bought'] >= achievement['value']:
						achievement['unlocked'] = true
				ON_BUY_TOOL_ACHIEVEMENT:
					if data['misc']['tool_bought'] >= achievement['value']:
						achievement['unlocked'] = true
				ON_UPGRADE_FOOD_ACHIEVEMENT:
					if data['misc']['food_upgraded'] >= achievement['value']:
						achievement['unlocked'] = true
				ON_UPGRADE_TOOL_ACHIEVEMENT:
					if data['misc']['tool_upgraded'] >= achievement['value']:
						achievement['unlocked'] = true
				ON_INCOME_ACHIEVEMENT:
					if data['misc']['total_income'] >= achievement['value']:
						achievement['unlocked'] = true
						
			if achievement['unlocked']:
				print("showing message...")
				EventManager.emit_signal("show_message", 'Achivement unlocked : %s' % achievement['name'])
			
			emit_signal("achievement_updated", achievement)


func redeem_gem_reward(achievement_name : String) -> void:
	for achievement in data['achievements']:
		if achievement['name'] == achievement_name:
			var current_gems = data['currency']['gems']
			current_gems += achievement['reward']
			set_gems(current_gems)
			achievement['redeemed'] = true


func redeem_coin_reward(achievement_name : String) -> void:
	for achievement in data['achievements']:
		if achievement['name'] == achievement_name:
			var current_gems = data['currency']['money']
			current_gems += achievement['reward']
			set_gems(current_gems)
			achievement['redeemed'] = true


func set_gems(value) -> void:
	data['currency']['gems'] = value


func set_ipm(value) -> void:
	data['currency']['ipm'] = value
	emit_signal("ipm_changed", value)


func get_ipm() -> int:
	return data['currency']['ipm']


func set_idle_value(value) -> void:
	data['currency']['idle_value'] = value
	emit_signal("idle_value_changed", value)


func get_idle_value() -> int:
	return data['currency']['idle_value']


func set_tap_value(value) -> void:
	data['currency']['tap_value'] = value
	emit_signal("tap_value_changed", value)


func get_tap_value() -> int:
	return data['currency']['tap_value']


func set_money(value) -> void:
	data["currency"]["money"] = value
	emit_signal("money_changed", value)


func get_money() -> int:
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
	if selected_item['effect'] == EffectStatus.IDLE_INCOME:
		var temp : int = DataManager.get_idle_value()
		temp += selected_item['effect_value']
		DataManager.set_idle_value(temp)
	elif selected_item['effect'] == EffectStatus.TAP_INCOME:
		var temp : int = DataManager.get_tap_value()
		temp += selected_item['effect_value']
		DataManager.set_tap_value(temp)
	
	var new_currency = data['currency']['money'] - selected_item['price']
	set_money(new_currency)
	
	if selected_item['level'] == 1:
		match(selected_item['type']):
			'ingredient':
				data['misc']['food_bought'] += 1
				check_achievement(DataManager.ON_BUY_FOOD_ACHIEVEMENT)
			'tool':
				data['misc']['tool_bought'] += 1
				check_achievement(DataManager.ON_BUY_TOOL_ACHIEVEMENT)
	else:
		match(selected_item['type']):
			'ingredient':
				data['misc']['food_upgraded'] += 1
				check_achievement(DataManager.ON_UPGRADE_FOOD_ACHIEVEMENT)
			'tool':
				data['misc']['tool_upgraded'] += 1
				check_achievement(DataManager.ON_UPGRADE_TOOL_ACHIEVEMENT)
	
	selected_item['effect_value'] = selected_item['effect_value'] * selected_item['effect_multiplier']
	selected_item['level'] += 1
	selected_item['price_multiplier'] = set_price_multiplier(selected_item['base_price'], selected_item['level'])
	selected_item['price'] *= selected_item['price_multiplier']
	selected_item['price'] = floor(selected_item['price'])
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


func get_items(type, shop_name) -> Array:
	var result = []
	for item in data['shop']['items']:
		if item['shop_name'] == shop_name and item['type'] == type:
			result.append(item)
	return result


func get_last_autosave_time() -> int:
	return data["last_save_timestamp"]


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		SaveManager.save_data(data)
		EventManager.emit_signal("quit_pop_up")
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		SaveManager.save_data(data)
		EventManager.emit_signal("quit_pop_up")



func reset_default_data() -> void:
	data = default_data.duplicate(true)


func calculate_passive_income() -> void:
	var time_start = data["last_save_timestamp"]
	var time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var minutes = elapsed / 60
	var seconds = int(elapsed) % 60
	
	var str_elapsed = "%02d : %02d" % [minutes, seconds]
	print("Last save elapsed : %s (%.2f minutes)" % [str_elapsed, minutes])
	
	var total_passive_income = floor(minutes * data["currency"]["ipm"])
	print("Total passive income : ", total_passive_income)
	
	data["currency"]["money"] += total_passive_income

extends Node

onready var path = "user://config.ini"
var sfx_on = true
var bgm_on = true


func _ready():
	load_config()


func save_config():
	var config = ConfigFile.new()
	config.set_value("audio", "sfx", sfx_on)
	config.set_value("audio", "bgm", bgm_on)
	var err = config.save(path)
	if err != OK:
		print("Error saving config file")


func load_config():
	var config = ConfigFile.new()
	var default_settings = {
		"sfx" : true,
		"bgm" : true
		}
	var err = config.load(path)
	if err != OK:
		print("Load config error, setting to default values")
	sfx_on = config.get_value("audio", "sfx", default_settings["sfx"])
	bgm_on = config.get_value("audio", "bgm", default_settings["bgm"])


func is_sfx_on():
	return sfx_on


func is_bgm_on():
	return bgm_on


func toggle_sfx():
	sfx_on = !sfx_on
	save_config()


func toggle_bgm():
	bgm_on = !bgm_on
	save_config()

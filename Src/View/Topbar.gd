extends CanvasLayer

signal settings_pressed
signal achievement_pressed
signal quest_pressed
signal map_pressed


func _ready():
	DataManager.connect("money_changed", self, "set_income")
	DataManager.connect("ipm_changed", self, "set_ipm_view")
	
	set_income(DataManager.data["currency"]["money"])
	set_ipm_view(DataManager.data["currency"]["ipm"])


func set_income(value) -> void:
	$Bar/Title.text = "Rp. %s" % value


func set_ipm_view(value) -> void:
	$IncomeContainer/VBoxContainer/Income.text = "Rp. %s /menit" % value


func _on_DebugMoney_pressed():
	var money = DataManager.get_money()
	money += 10000
	DataManager.set_money(money)
	SoundManager.play_sfx("coin")


func _on_Map_pressed():
	SoundManager.play_sfx("click")
	emit_signal("map_pressed")


func _on_Quest_pressed():
	SoundManager.play_sfx("click")
	emit_signal("quest_pressed")


func _on_Achievement_pressed():
	SoundManager.play_sfx("click")
	emit_signal("achievement_pressed")


func _on_Settings_pressed():
	SoundManager.play_sfx("click")
	emit_signal("settings_pressed")

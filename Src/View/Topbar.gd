extends CanvasLayer

func _ready():
	set_income(0)
	set_ipm_view(0)
	DataManager.connect("money_changed", self, "set_income")
	DataManager.connect("ipm_changed", self, "set_ipm_view")

func set_income(value) -> void:
	$Bar/Title.text = "Rp. %s" % value

func set_ipm_view(value) -> void:
	$IncomeContainer/VBoxContainer/Income.text = "Rp. %s /menit" % value

func _on_DebugMoney_pressed():
	var money = DataManager.get_money()
	money += 10000
	DataManager.set_money(money)


func _on_Map_pressed():
	pass # Replace with function body.


func _on_Quest_pressed():
	pass # Replace with function body.


func _on_Config_pressed():
	pass # Replace with function body.


func _on_Achievement_pressed():
	pass # Replace with function body.

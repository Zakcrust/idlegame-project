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

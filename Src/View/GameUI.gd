extends CanvasLayer

func _ready():
	DataManager.connect("money_changed", self, "set_earnings")

func set_earnings(value : int) -> void:
	$Control/Earnings.text = "Rp. %s " % value

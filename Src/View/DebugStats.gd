extends CanvasLayer

var total_tap = 0


func _ready():
	update_last_autosave()


func update_total_tap() -> void:
	total_tap += 1
	$HBoxContainer/Value/TotalTap.text = str(total_tap)


func update_last_autosave() -> void:
	var last_autosave_timestamp = DataManager.get_last_autosave_time()
	var date = OS.get_datetime_from_unix_time(last_autosave_timestamp)
	var string_format = "{year}/{month}/{day} {hour}:{minute}:{second}"
	$HBoxContainer/Value/LastAutoSave.text = string_format.format(date)


func reset_stats():
	total_tap = -1
	update_total_tap()
	update_last_autosave()

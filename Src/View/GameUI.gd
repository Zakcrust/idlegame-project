extends CanvasLayer


func _on_Topbar_settings_pressed():
	$Settings.display()
	DataManager.can_tap = false


func _on_Topbar_quest_pressed():
	$Quest.display()
	DataManager.can_tap = false


func _on_Topbar_map_pressed():
	$Map.display()
	DataManager.can_tap = false


func _on_Topbar_achievement_pressed():
	$Achivement.display()
	DataManager.can_tap = false

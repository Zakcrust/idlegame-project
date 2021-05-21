extends CanvasLayer

onready var achievement_item_scene = preload("res://Src/Components/AchievementItems/AchievementItem.tscn")
onready var container = $Control/DrawerContainer/VBoxContainer/ScrollContainer/AchievementContainer

var achievements


func _ready():
	DataManager.connect("achievement_updated", self, "update_achievement")
	achievements = DataManager.data['achievements']
	for achievement in achievements:
		var item = achievement_item_scene.instance()
		item.init_achivement_item(achievement)
		container.add_child(item)


func update_achievement(value) -> void:
	for child in container.get_children():
		if child.achievement_name == value['name']:
			child.unlocked = true


func display():
	$AnimationPlayer.play("display_drawer")
	DataManager.can_tap = false
 

func _on_Back_pressed():
	SoundManager.play_sfx("click")
	$AnimationPlayer.play("hide_drawer")
	DataManager.can_tap = true

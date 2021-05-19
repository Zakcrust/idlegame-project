extends CanvasLayer


onready var achievement_item_scene = preload("res://Src/Components/AchievementItems/AchievementItem.tscn")
onready var container = $Control/DrawerContainer/VBoxContainer/ScrollContainer/AchievementContainer


func _ready():
	for i in range(25):
		var item = achievement_item_scene.instance()
		container.add_child(item)


func display():
	$AnimationPlayer.play("display_drawer")
 

func _on_Back_pressed():
	SoundManager.play_sfx("click")
	$AnimationPlayer.play("hide_drawer")

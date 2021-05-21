extends CanvasLayer


onready var quest_item_scene = preload("res://Src/Components/QuestItems/QuestItem.tscn")
onready var container = $Control/DrawerContainer/VBoxContainer/ScrollContainer/QuestContainer


func _ready():
	for i in range(10):
		var item = quest_item_scene.instance()
		container.add_child(item)


func display():
	$AnimationPlayer.play("display")
 

func _on_Mask_gui_input(event):
	if event is InputEventMouseButton and $Control/Mask.modulate.a8 == 70:
		$AnimationPlayer.play("hide")
		DataManager.can_tap = true

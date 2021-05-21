extends ColorRect


var unlocked : bool = false
var achievement_name : String
var achievement_description : String
var achievement_value : int
var achievement_reward : int
var achieved : bool = false
var redeemed : bool = false

func _ready():
	pass # Replace with function body.

func init_achivement_item(achievement) -> void:
	achievement_name = achievement['name']
	achievement_description = achievement['description']
	achievement_value = achievement['value']
	achievement_reward = achievement['reward']
	unlocked = achievement['unlocked']
	redeemed = achievement['redemeed']
	
	$HBoxContainer/Labels/Name.text = achievement_name
	$HBoxContainer/Labels/Description.text = achievement_description
	$HBoxContainer/Reward/VBoxContainer/Value.text = str(achievement_reward)
	
	self.rect_size = $HBoxContainer.rect_size

func update_item() -> void:
	if redeemed:
		unlocked = false
		$HBoxContainer/Reward/VBoxContainer/Title.text = "Completed"

func _on_Reward_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if unlocked:
				redeemed = true
				update_item()

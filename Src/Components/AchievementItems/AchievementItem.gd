extends ColorRect


var unlocked : bool = false
var achievement_name : String
var achievement_description : String
var achievement_value : int
var achievement_reward : int
var achieved : bool = false
var redeemed : bool = false
var progress_value : float


func _ready():
	pass # Replace with function body.

func init_achievement_item(achievement) -> void:
	achievement_name = achievement['name']
	achievement_description = achievement['description']
	achievement_value = achievement['value']
	achievement_reward = achievement['reward']
	unlocked = achievement['unlocked']
	redeemed = achievement['redeemed']
	
	$HBoxContainer/Labels/Name.text = achievement_name
	$HBoxContainer/Labels/Description.text = achievement_description
	$HBoxContainer/CenterContainer2/Reward/VBoxContainer/Value.text = str(achievement_reward)
	
	match(achievement['type']):
		DataManager.ON_TAP_ACHIVEMENT:
			progress_value = DataManager.data['misc']['total_tap_pressed']
		DataManager.ON_INCOME_ACHIEVEMENT:
			progress_value = DataManager.data['misc']['total_income']
		DataManager.ON_BUY_FOOD_ACHIEVEMENT:
			progress_value = DataManager.data['misc']['food_bought']
		DataManager.ON_BUY_TOOL_ACHIEVEMENT:
			progress_value = DataManager.data['misc']['tool_bought']
		DataManager.ON_UPGRADE_FOOD_ACHIEVEMENT:
			progress_value = DataManager.data['misc']['food_upgraded']
		DataManager.ON_UPGRADE_TOOL_ACHIEVEMENT:
			progress_value = DataManager.data['misc']['tool_upgraded']
	
	$HBoxContainer/Labels/ProgressBar.max_value = achievement_value
	
	if progress_value >= achievement_value:
		$HBoxContainer/Labels/ProgressBar.value = achievement_value
	else:
		$HBoxContainer/Labels/ProgressBar.value = progress_value
		
	if redeemed:
		$HBoxContainer/CenterContainer2/Reward/VBoxContainer/Title.text = "Completed"
	
	
	self.rect_size = $HBoxContainer.rect_size

func update_item() -> void:
	if redeemed:
		unlocked = false
		$HBoxContainer/CenterContainer2/Reward/VBoxContainer/Title.text = "Completed"

func _on_Reward_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if unlocked:
				redeemed = true
				DataManager.redeem_gem_reward(achievement_name)
				update_item()

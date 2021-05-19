extends Node

const save_file = "user://save_data.save"
var dir : Directory = Directory.new()
var file : File = File.new()

func save(file_name : String, data : Dictionary) -> void:
	file.open(file_name, File.WRITE)
	file.store_line(to_json(data))
	file.close()
#	EventManager.emit_signal("show_pop_up", "Game saved")
	
func load_save(file_name : String) -> void:
	if dir.dir_exists(save_file):
		file.open(file_name, File.READ)
		DataManager.data = parse_json(file.get_line())
		file.close()

func delete_save(file_name : String) -> void:
	if dir.dir_exists(save_file):
		dir.remove(save_file)

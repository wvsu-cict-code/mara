extends Node

var bus_name
var Vol

const Filename = "user://savegame.save"

func def_vol():
	if not FileAccess.file_exists(Filename):
		return # Error! We don't have a save to load.
	
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()
		print(i," Deleted")
		
	var Save_game = FileAccess.open(Filename, FileAccess.READ)
	while Save_game.get_position() < Save_game.get_length():
		var data = Save_game.get_line()
		var json = JSON.new()
		var parse = json.parse(data)
		if not parse == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", data, " at line ", json.get_error_line())
			continue
		var node_data = json.get_data()
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.call("update_Slide",node_data["BusName"],-10)


func save_settings():
	var file = FileAccess.open(Filename,FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
		
		var S_data = node.call("save")
		var json = JSON.stringify(S_data)
		
		file.store_line(json)

func load_settings():
	if not FileAccess.file_exists(Filename):
		return # Error! We don't have a save to load.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	var Save_game = FileAccess.open(Filename, FileAccess.READ)
	while Save_game.get_position() < Save_game.get_length():
		var data = Save_game.get_line()
		if data.is_empty():
			save_settings()
		else:
			for i in save_nodes:
				i.queue_free()
		var json = JSON.new()
		var parse = json.parse(data)
		if not parse == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", data, " at line ", json.get_error_line())
			continue
		var node_data = json.get_data()
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.call("update_Slide",node_data["BusName"],node_data["Volume"])
	

func load_vol():
	if not FileAccess.file_exists(Filename):
		return # Error! We don't have a save to load.
	var Save_game = FileAccess.open(Filename, FileAccess.READ)
	while Save_game.get_position() < Save_game.get_length():
		var data = Save_game.get_line()
		var json = JSON.new()
		var parse = json.parse(data)
		if not parse == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", data, " at line ", json.get_error_line())
			continue
		var node_data = json.get_data()
		var sound = load("res://scene/ui/Sounds.tscn").instantiate()
		sound.call("volFromsettings",node_data["BusName"],node_data["Volume"])

	
	

extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var actions = [
	"Add",
	"Delete"
]

var types = [
	"Pickup",
	"Liquid"
]
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.test_file(Globals.default_file)
	print(Globals.working_layout["gameConfig"]["startingRoom"])
	Globals.vanilla_data(Globals.default_file)
	var i = 0
	for x in actions:
		get_parent().get_node("ActionButton").add_item(x, i)
		i+=1
	i = 0
	for x in types:
		get_parent().get_node("TypeChoice").add_item(x, i)
		i+=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func create_node(_name,index, type,data):
	var node = {
		"name": _name,
		"index": index,
		"type": type,
		"data": data
	}
	return node

var room_nodes = []
## ToDo: Make Node object?
# {name:"",type:"",index int, data:{}}
func _on_Room_item_selected(index):
	clear()
	room_nodes = []
	if not Globals.current_world:
		Globals.current_world = get_parent().get_node("Area").get_item_text(get_parent().get_node("Area").get_selected_id())
	Globals.current_room = Globals.get_array(Globals.current_world)[index]
	var roomData = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.get_array(Globals.current_world)[index]]
	var i= 0
	for x in roomData["doors"].values():
		var doorName
		if Globals.names.has(Globals.current_room):
			if Globals.names[Globals.current_room].has(str(i)):
				doorName = Globals.names[Globals.current_room][str(i)]
			else:
				doorName = str(i)
		else:
			doorName = str(i)
		room_nodes.append( create_node("Door"+str(i), i,"door", x))
		add_item("Door to "+doorName)
		i+=1
	i = 0
	for x in roomData["liquids"]:
		room_nodes.append(create_node("Liquid"+str(i), i,"liquid", x))
		add_item("Liquid "+str(i))
		i+=1
	i=0
	for x in roomData["pickups"]:
		room_nodes.append(create_node("Pickup"+str(i),i, "pickup", x))
		add_item("Pickup "+str(i))
		i+=1

func clear_details():
	for n in get_parent().get_node("Node Details").get_children():
		get_parent().get_node("Node Details").remove_child(n)
		n.queue_free()

var node_type = {
	"door": "res://Door/Door Node.tscn",
	"pickup": "res://Item/Item Node.tscn",
	"liquid": "res://Liquid/Liquid node.tscn"
}

func _on_Nodes_item_selected(index):
	clear_details()
	var details = get_parent().get_node("Node Details")
	var node_scene = load(node_type[room_nodes[index]["type"]])
	var node = node_scene.instance()
	print(room_nodes[index]["data"])
	print(index)
	print(room_nodes[index]["data"]["type"])
	Globals.node_details = room_nodes[index]["data"]
	Globals.working_index = room_nodes[index]["index"]
	details.add_child(node)
	print(Globals.vanilla["levelData"][Globals.current_world]["rooms"][Globals.current_room]["pickups"].size())
	if "Pickup" in room_nodes[index]["name"] and (int(room_nodes[index]["name"].right(6)) >= Globals.vanilla["levelData"][Globals.current_world]["rooms"][Globals.current_room]["pickups"].size()):
		details.get_node("Item Node").get_node("Panel").get_node("Position").get_node("ChangePosition").pressed = true
		details.get_node("Item Node").get_node("Panel").get_node("Position").get_node("ChangePosition").disabled = true
	
		
	#if room_nodes[index]["type"] == "pickup":
	#	var pickup_scene = load("res://Item Node.tscn")
	#	var pickup = pickup_scene.instance()
	#	details.add_child(pickup)

func refresh_nodes():
	clear()
	if Globals.current_world == "End of Game":
		return
	room_nodes = []
	var roomData = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]
	var i= 0
	for x in roomData["doors"].values():
		var doorName = Globals.names[Globals.current_room][str(i)]
		room_nodes.append( create_node("Door"+str(i), i,"door", x))
		add_item("Door to "+doorName)
		i+=1
	i = 0
	for x in roomData["liquids"]:
		room_nodes.append(create_node("Liquid"+str(i), i,"liquid", x))
		add_item("Liquid "+str(i))
		i+=1
	i=0
	for x in roomData["pickups"]:
		room_nodes.append(create_node("Pickup"+str(i),i, "pickup", x))
		add_item("Pickup "+str(i))
		i+=1

func _on_Button_pressed():
	if Globals.current_world == "End of Game":
		return
	var new_pickup = {
		"type": "Nothing",
		"model": "Nothing",
		"scanText": "Nothing",
		"hudmemoText": "Nothing Acquired",
		"currIncrease": 1,
		"maxIncrease": 1,
		"respawn": false,
		"modalHudmemo": null,
		"position": null,
		"destination": null
	}
	var new_liquid = {
		"type": "Water"
	}
	var type_node = get_parent().get_node("TypeChoice")
	var action_node = get_parent().get_node("ActionButton")
	var type = type_node.get_item_text(type_node.get_selected_id())
	var action = action_node.get_item_text(action_node.get_selected_id())
	print(action)
	print(type)
	if type == "Pickup":
		if action == "Delete":
			if typeof(Globals.working_index) == TYPE_INT:
				print(Globals.working_index)
				if get_parent().has_node("Node Details/Item Node"):
					if get_parent().get_node("Node Details/Item Node/Panel/Position/ChangePosition").disabled:
						Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["pickups"].pop_at(Globals.working_index)
						Globals.working_index -= 1
						refresh_nodes()
		else:
			if Globals.current_room == null:
				return
			Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["pickups"].push_back(new_pickup)
			refresh_nodes()
	else:
		if action == "Delete":
			if typeof(Globals.working_index) == TYPE_INT:
				print(Globals.working_index)
				if get_parent().has_node("Node Details/Liquid node"):
					if get_parent().get_node("Node Details/Liquid node/Position/Position/ChangePosition").disabled:
						Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["liquids"].pop_at(Globals.working_index)
						Globals.working_index -= 1
						refresh_nodes()
		else:
			if Globals.current_room == null:
				return
			Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["liquids"].push_back(new_liquid)
			refresh_nodes()

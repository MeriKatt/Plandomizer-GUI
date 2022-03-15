extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.test_file(Globals.default_file)
	print(Globals.working_layout["gameConfig"]["startingRoom"])
	Globals.vanilla_data(Globals.default_file)


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
	Globals.current_room = Globals.get_array(Globals.current_world)[index]
	var roomData = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.get_array(Globals.current_world)[index]]
	var i= 0
	for x in roomData["doors"].values():
		room_nodes.append( create_node("Door"+str(i), i,"door", x))
		add_item("Door "+str(i))
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
	room_nodes = []
	var roomData = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]
	var i= 0
	for x in roomData["doors"].values():
		room_nodes.append( create_node("Door"+str(i), i-1,"door", x))
		add_item("Door "+str(i))
		i+=1
	i = 0
	for x in roomData["liquids"]:
		room_nodes.append(create_node("Liquid"+str(i), i-1,"liquid", x))
		add_item("Liquid "+str(i))
		i+=1
	i=0
	for x in roomData["pickups"]:
		room_nodes.append(create_node("Pickup"+str(i),i-1, "pickup", x))
		add_item("Pickup "+str(i))
		i+=1

func _on_Add_Pickup_Button_pressed():
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
	if Globals.current_room == null:
		return
	Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["pickups"].push_back(new_pickup)
	refresh_nodes()

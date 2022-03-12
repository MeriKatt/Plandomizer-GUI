extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.test_file(Globals.default_file)
	print(Globals.working_layout["gameConfig"]["startingRoom"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func create_node(_name,type,data):
	var node = {
		"name": _name,
		"type": type,
		"data": data
	}
	return node

var room_nodes = []
## ToDo: Make Node object?
# {name:"",type:"",data:{}}
func _on_Room_item_selected(index):
	room_nodes = []
	Globals.current_room = Globals.get_array(Globals.current_world)[index]
	var roomData = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.get_array(Globals.current_world)[index]]
	var i= 1
	for x in roomData["doors"]:
		room_nodes.append( create_node("Door"+str(i), "door", x))
		add_item("Door"+str(i))
		i+=1
	i = 1
	for x in roomData["liquids"]:
		room_nodes.append(create_node("Liquid"+str(i), "liquid", x))
		add_item("Liquid"+str(i))
		i+=1
	i=1
	for x in roomData["pickups"]:
		room_nodes.append(create_node("Pickup"+str(i), "pickup", x))
		add_item("Pickup"+str(i))
		i+=1


func clear_details():
	for n in get_parent().get_node("Node Details").get_children():
		get_parent().get_node("Node Details").remove_child(n)
		n.queue_free()

func _on_Nodes_item_selected(index):
	var details = get_parent().get_node("Node Details")
	if room_nodes[index]["type"] == "door":
		var door_scene = load("res://Door Node.tscn")
		var door = door_scene.instance()
		details.add_child(door)
	if room_nodes[index]["type"] == "pickup":
		var pickup_scene = load("res://Item Node.tscn")
		var pickup = pickup_scene.instance()
		details.add_child(pickup)
	pass # Replace with function body.

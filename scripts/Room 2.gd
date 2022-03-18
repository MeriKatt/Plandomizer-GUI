extends OptionButton

func DePrint(obj):
	 Globals.DePrint(obj)

var worlds = Globals.worlds

var elevators_world = Globals.elevators_world
var elevators_room = Globals.elevators_room
var current_world = null
var current_room = null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 1
	var array = Globals.get_array("Frigate Orpheon")
	for x in array:
		add_item(x,i)
		i+=1
	select(1)
	Globals.current_room = array[0]
	Globals.current_world = "Frigate Orpheon"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_item_selected(index):
	if worlds[index] == "":
		return
	Globals.current_world = worlds[index]
	clear()
	var i = 1
	var array = Globals.get_array(Globals.current_world)
	for x in array:
		add_item(x,i)
		i+=1


func _on_Room_item_selected(index):
	var RoomOptions = get_parent().get_node("RoomOptions")
	Globals.current_room = get_item_text(get_selected_id() -1)
	DePrint(Globals.current_room)
	var room = Globals.working_layout["levelData"][Globals.current_world]["rooms"][str(Globals.current_room)]
	RoomOptions.get_node("drainLiquids").pressed = room["removeWater"]
	RoomOptions.get_node("superheated").pressed = room["superheated"]
	RoomOptions.get_node("submergeRoom").pressed = false

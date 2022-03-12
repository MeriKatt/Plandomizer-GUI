extends OptionButton
func DePrint(obj):
	 Globals.DePrint(obj)

var worlds = Globals.worlds

var elevators_world = Globals.elevators_world
var elevators_room = Globals.elevators_room

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_world = null


# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 1
	var array = Globals.get_array("Frigate Orpheon")
	for x in array:
		add_item(x,i)
		i+=1

var current_room = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		pass


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
	Globals.current_room = Globals.get_array(Globals.current_world)[index]
	DePrint(Globals.current_room)


func _on_Elevators_item_selected(_index):
	var elev = Globals.elevators[_index]
	if elev == "":
		return
	var world = elevators_world[elev]
	var room = elevators_room[elev]
	Globals.current_room = room
	var ind = 0
	for x in worlds:
		if x == world:
			clear()
			Globals.current_world = world
			DePrint(Globals.current_world)
			var array = Globals.get_array(Globals.current_world)
			DePrint(array)
			var l = 0
			for c in array:
				add_item(c,l)
				if c == room:
					ind = l	
				l+=1
			select(ind)


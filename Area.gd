extends OptionButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var worlds = Globals.worlds
var elevators_world = Globals.elevators_world
# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 1
	for x in worlds:
		add_item(x,i)
		i += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Elevators_item_selected(_index):
	var elev = Globals.elevators[_index]
	if elev == "":
		return
	var world = elevators_world[elev]
	var i = 0
	for x in worlds:
		if x == world:
			select(i)
		else:
			i +=1 

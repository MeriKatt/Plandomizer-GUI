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



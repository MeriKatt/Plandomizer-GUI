extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var elevators = Globals.elevators
		
# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 1
	for x in elevators:
		add_item(x, i)
		i = i+1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

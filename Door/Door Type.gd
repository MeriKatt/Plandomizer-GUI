extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var parent = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	var types = get_parent().door_types
	var i = 1
	for x  in types:
		add_item(x, i)
		i+=1# Replace with function body.
	i = 0
	for x in types:
		if x == Globals.node_details["type"]:	
			select(i)
		else:
			i+=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

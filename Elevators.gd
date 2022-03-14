extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var cur_elev

func _on_Elevator_item_selected(index):
	cur_elev = Globals.elevators[index]
	var container = get_node("Destination Conainer")
	var elevator_node = load("res://Transporter/Transporter Node.tscn")
	var instance = elevator_node.instance()
	container.add_child(instance)

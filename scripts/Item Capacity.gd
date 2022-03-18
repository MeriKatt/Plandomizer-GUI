extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for x in get_children():
		if x.get_class() != "Button":
			if x.get_name() == "etankCapacity":
				x.get_node("amount").set_value(int(Globals.working_layout["gameConfig"]["etankCapacity"]))
			else:
				x.get_node("amount").set_value(int(Globals.working_layout["gameConfig"]["itemMaxCapacity"][x.get_name()]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SaveItemCapacitty_pressed():
	for x in get_children():
		if x.get_class() != "Button":
			if x.get_name() == "etankCapacity":
				Globals.working_layout["gameConfig"]["etankCapacity"] = int(x.get_node("amount").get_value())
			else:
				Globals.working_layout["gameConfig"]["itemMaxCapacity"][x.get_name()] = int(x.get_node("amount").get_value())

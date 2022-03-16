extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for x in get_children():
		if Globals.working_layout["tweaks"].empty():
			if x.get_class() == "Control":
				x.get_node("LineEdit").text = "1.0"
		elif Globals.working_layout["tweaks"].has(x.get_name()):
			if x.get_class() == "Control":
				x.get_node("LineEdit").text = String(Globals.working_layout["tweaks"][x.get_name()])
		elif Globals.working_layout["tweaks"]["playerSize"] == 0.3 and Globals.working_layout["tweaks"]["morphBallSize"] == 0.3 and Globals.working_layout["tweaks"]["easyLavaEscape"] == true and x.get_class() == "CheckBox":
			x.pressed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SaveTweaks_pressed():
	for x in get_children():
		if x.get_class() == "CheckBox":
			if x.pressed:
				Globals.working_layout["tweaks"]["playerSize"] = 0.3
				Globals.working_layout["tweaks"]["morphBallSize"] = 0.3
				Globals.working_layout["tweaks"]["easyLavaEscape"] = true
			else:
				Globals.working_layout["tweaks"]["playerSize"] = 1.0
				Globals.working_layout["tweaks"]["morphBallSize"] = 1.0
				Globals.working_layout["tweaks"]["easyLavaEscape"] = false
		elif x.get_class() == "Control":
			Globals.working_layout["tweaks"][x.get_name()] = float(x.get_node("LineEdit").text)

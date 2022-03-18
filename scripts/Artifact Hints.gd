extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for x in get_children():
		if x.get_class() != "Button":
			x.get_node("LineEdit").text = Globals.working_layout["gameConfig"]["artifactHints"][x.get_name()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SaveHints_pressed():
	for x in get_children():
		if x.get_class() != "Button":
			Globals.working_layout["gameConfig"]["artifactHints"][x.get_name()] = x.get_node("LineEdit").text

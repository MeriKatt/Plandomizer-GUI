extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("hudColor/LineEdit").text = "[R,G,B]"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_saveButton_pressed():
	var json = parse_json(get_node("hudColor/LineEdit").text)
	if get_node("hudColor/LineEdit").text.find("[") and get_node("hudColor/LineEdit").text.find("]") and get_node("hudColor/LineEdit").text != "[R,G,B,]":
		if json.size() < 3 or json.size() > 3:
			print("bad size")
			return
		if json[0] > 255:
			json[0] = 255
		elif json[0] < 0:
			json[0] = 0
		if json[1] > 255:
			json[1] = 255
		elif json[1] < 0:
			json[1] = 0
		if json[2] > 255:
			json[2] = 255
		elif json[2] < 0:
			json[2] = 0
		Globals.working_layout["tweaks"]["hudColor"] = json
	else:
		Globals.working_layout["tweaks"]["hudColor"] = null
	print(json)

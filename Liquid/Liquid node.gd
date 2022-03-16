extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var size

# Called when the node enters the scene tree for the first time.
func _ready():
	var liquid = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["liquids"][Globals.working_index]
	if liquid.has("size"):
		get_node("sizeCheck").pressed = true
		get_node("LineEdit").text = str(liquid["size"])
	if liquid.has("position"):
		get_node("Position/Position/ChangePosition").pressed = true
		var x = get_node("Position/Position/X Position")
		var y = get_node("Position/Position/Y Position")
		var z = get_node("Position/Position/Z Position")
		x.text= str(liquid["position"][0])
		y.text= str(liquid["position"][1])
		z.text= str(liquid["position"][2])


func get_size():
	if parse_json(get_node("LineEdit").text) != null:
		if get_node("sizeCheck").pressed:
			return parse_json(get_node("LineEdit").text)
		else:
			return null
	else:
		return null
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	size = get_size()
	var json = {}
	if get_node("Position/Position/ChangePosition").pressed:
		var x = get_node("Position/Position/X Position").text
		var y = get_node("Position/Position/Y Position").text
		var z = get_node("Position/Position/Z Position").text
		if size != null:
			json = {
				"type": get_node("Liquid Type/Type").get_item_text(get_node("Liquid Type/Type").get_selected_id()),
				"position": [float(x) ,float(y) ,float(z)],
				"size": size
			}
		else:
			json = {
				"type": get_node("Liquid Type/Type").get_item_text(get_node("Liquid Type/Type").get_selected_id()),
				"position": [float(x) ,float(y) ,float(z)]
				
			}
	else:
		if size != null:
			json = {
				"type": get_node("Liquid Type/Type").get_item_text(get_node("Liquid Type/Type").get_selected_id()),
				"size" : size
			}
		else:
			json = {
				"type": get_node("Liquid Type/Type").get_item_text(get_node("Liquid Type/Type").get_selected_id()),
			}	
	Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["liquids"][Globals.working_index] = json
	

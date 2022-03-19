extends Control

var cur_type
var cur_shield
var warp_enabled
var cur_warp
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var door_types = [
	"Blue",
	"Power Only",
	"Purple",
	"White",
	"Red",
	"Power Bomb",
	"Bomb",
	"Missile",
	"Charge",
	"Super Missile",
	"Wavebuster",
	"Ice Spreader",
	"Flamethrower",
	"AI",
	"Disabled",
]

var shield_types = [
	"null",
	"Missile",
	"Power Bomb",
	"Super Missile",
	"Wavebuster",
	"Ice Spreader",
	"Flamethrower",
]

var rooms = Globals.get_array(Globals.current_world)
var door_details
# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"].has(str(Globals.working_index)):
		door_details = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index)]
	else:
		door_details = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index + 1)]
	var i = 1
	
	for x in rooms:
		get_node("Door Warp destination").add_item(x, i)
		i+=1
	print(typeof(door_details["destination"]))
	print("hello")
	if typeof(door_details["destination"]) == TYPE_DICTIONARY and door_details["destination"].has("roomName"):
		get_node("Door Warp Checkbox").pressed = true
		get_node("Door Warp destination").select(rooms.find(door_details["destination"]["roomName"]))
		cur_warp = rooms.find(door_details["destination"]["roomName"])
		get_node("warpDock").clear()
		var x = 0
		var c = 0
		while x <= (Globals.working_layout["levelData"][Globals.current_world]["rooms"][door_details["destination"]["roomName"]]["doors"].size()):
			get_node("warpDock").add_item(str(c), 0)
			x+=1
			c+=1
		get_node("warpDock").select(door_details["destination"]["dockNum"])
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Door_Warp_destination_item_selected(index):
	cur_warp = rooms[index]
	get_node("warpDock").clear()
	var x = 0
	var i = 0
	while x <= (Globals.working_layout["levelData"][Globals.current_world]["rooms"][rooms[index]]["doors"].size()):
		get_node("warpDock").add_item(str(i), x)
		x+=1
		i+=1
	get_node("warpDock").select(0)
	door_details["destination"] = {
		"roomName": cur_warp,
		"dockNum": 0
	}
	if get_node("Door Warp Checkbox").pressed:
		Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)
	

func _on_Blastshield_Type_item_selected(index):
	cur_shield = shield_types[index]
	print(cur_shield)
	if cur_shield == "null":
		cur_shield = null
	door_details["blastShield"] = cur_shield
	Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)
	#print(Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index)])
	#print(str(Globals.working_index))

func _on_Door_Type_item_selected(index):
	cur_type = door_types[index]
	door_details["type"] = cur_type
	Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)
	#print(Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index)])


func _on_warpDock_item_selected(index):
	var cur_dock = int(get_node("warpDock").get_item_text(index))
	door_details["destination"] = {
		"roomName": cur_warp,
		"dockNum": cur_dock
	}
	if get_node("Door Warp Checkbox").pressed:
		Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)


func _on_Door_Warp_Checkbox_pressed():
	pass

func _on_Door_Warp_Checkbox_toggled(button_pressed):
	if get_node("Door Warp Checkbox").pressed == false:
		door_details["destination"] = null
		Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)
		

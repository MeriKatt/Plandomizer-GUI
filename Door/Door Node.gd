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
	door_details = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index)]
	var i = 1

	for x in rooms:
		get_node("Door Warp destination").add_item(x, i)
		i+=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Door_Warp_destination_item_selected(index):
	cur_warp = rooms[index]
	var x = 1
	var i = 0
	while x <= (Globals.working_layout["levelData"][Globals.current_world]["rooms"][rooms[index]]["doors"].size()):
		get_node("warpDock").add_item(str(i), x)
		x+=1
		i+=1

func _on_Blastshield_Type_item_selected(index):
	cur_shield = shield_types[index]
	print(cur_shield)
	if cur_shield == "null":
		cur_shield = null
	door_details["blastShield"] = cur_shield
	Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)
	print(Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index)])
	print(str(Globals.working_index))

func _on_Door_Type_item_selected(index):
	cur_type = door_types[index]
	print(cur_type)
	door_details["type"] = cur_type
	Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)
	print(Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index)])


func _on_warpDock_item_selected(index):
	var cur_dock = int(get_node("warpDock").get_item_text(index))
	door_details["destination"] = {
		"roomName": cur_warp,
		"dockNum": cur_dock
	}
	if get_node("Door Warp Checkbox").pressed:
		Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)

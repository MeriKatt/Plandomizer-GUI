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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Door_Warp_destination_item_selected(index):
	pass # Replace with function body.


func _on_Blastshield_Type_item_selected(index):
	cur_shield = shield_types[index]
	print(cur_shield)
	door_details["blastShield"] = cur_shield
	Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)
	print(Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index)])


func _on_Door_Type_item_selected(index):
	cur_type = door_types[index]
	print(cur_type)
	door_details["type"] = cur_type
	Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"doors",str(Globals.working_index),door_details)
	print(Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["doors"][str(Globals.working_index)])

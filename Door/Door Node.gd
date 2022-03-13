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
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Door_Warp_destination_item_selected(index):
	pass # Replace with function body.


func _on_Blastshield_Type_item_selected(index):
	pass # Replace with function body.


func _on_Door_Type_item_selected(index):
	cur_type = door_types[index]
	print(cur_type)

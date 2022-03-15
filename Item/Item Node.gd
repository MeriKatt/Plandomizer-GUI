extends Node2D


var items = [
	"Boost Ball",
	"Charge Beam",
	"Combat Visor",
	"Energy Tank",
	"FlameThrower",
	"Grapple Beam",
	"Gravity Suit",
	"Health Refill",
	"Ice Beam",
	"Ice Spreader",
	"Missile Expansion",
	"Morph Ball",
	"Morph Ball Bombs",
	"Phazon Suit",
	"Plasma Beam",
	"Power Beam",
	"Power Bombs",
	"Power Bomb Expansion",
	"Scan Visor",
	"Space Jump",
	"Spider Ball",
	"Super Missile",
	"Thermal Visor",
	"Varia Suit",
	"Wave Beam",
	"Wave Buster",
	"X-ray Visor",
	"Artifact of Truth",
	"Artifact of Strength",
	"Artifact of Elder",
	"Artifact of Wild",
	"Artifact of Lifegiver",
	"Artifact of Warrior",
	"Artifact of Chozo",
	"Artifact of Nature",
	"Artifact of Sun",
	"Artifact of World",
	"Artifact of Spirit",
	"Artifact of Newborn",
	"Nothing"
]

var models = [
	"Missile",
	"Energy Tank",
	"Visor",
	"Combat Visor",
	"Thermal Visor",
	"X-Ray Visor",
	"Varia Suit",
	"Gravity Suit",
	"Phazon Suit",
	"Morph Ball",
	"Boost Ball",
	"Spider Ball",
	"Morph Ball Bomb",
	"Power Bomb Expansion",
	"Power Bomb",
	"Charge Beam",
	"Space Jump Boots",
	"Grapple Beam",
	"Super Missile",
	"Wavebuster",
	"Ice Spreader",
	"Flamethrower",
	"Wave Beam",
	"Ice Beam",
	"Plasma Beam",
	"Artifact of Lifegiver",
	"Artifact of Wild",
	"Artifact of World",
	"Artifact of Sun",
	"Artifact of Elder",
	"Artifact of Spirit",
	"Artifact of Truth",
	"Artifact of Chozo",
	"Artifact of Warrior",
	"Artifact of Newborn",
	"Artifact of Nature",
	"Artifact of Strength",
	"Nothing",
	"Health Refill",
	"Missile Refill",
	"Power Bomb Refill",
	"Shiny Missile"
]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var position_checkbox
var pos = {
	"pos_x": 0,
	"pos_y": 0,
	"pos_z": 0
}
var model_node
var scan_node
var memo_node
var item_node
var pop_up_node
var currInc
var maxInc
var respawn

func save_pickup():
	checked = get_node("Panel/Position/ChangePosition").pressed
	pos_x = get_node("Panel/Position/X Position").text
	pos_y = get_node("Panel/Position/Y Position").text
	pos_z = get_node("Panel/Position/Z Position").text
	model = models[get_node("Panel/ModelButton").get_selected_id()]
	scan = get_node("Panel/Scan Text").text
	acquisition = get_node("Panel/Pickup Text").text
	pop_up = get_node("Panel/CheckBox").pressed
	item = items[get_node("Panel/Selection/Item Selection").get_selected_id()-1]
	currInc = get_node("Panel/currIncrease/amount").get_value()
	maxInc = get_node("Panel/maxIncrease/amount").get_value()
	respawn = respawn_node.pressed
	var json = {}
	if checked:
		json = {
			"type": item,
			"model": model,
			"scanText": scan,
			"hudmemoText": acquisition,
			"currIncrease": currInc,
			"maxIncrease": maxInc,
			"respawn": respawn,
			"modalHudmemo": pop_up,
			"position": [float(pos_x),float(pos_y),float(pos_z)],
			"destination": null
		}
	else:
		json = {
			"type": item,
			"model": model,
			"scanText": scan,
			"hudmemoText": acquisition,
			"currIncrease": currInc,
			"maxIncrease": maxInc,
			"respawn": respawn,
			"modalHudmemo": pop_up,
			"position": null,
			"destination": null
		}
	
	print(json)
	Json_Handler.Save_Room_Array_Changes(Globals.current_world,Globals.current_room,"pickups",Globals.working_index,json)
var pickup
# Called when the node enters the scene tree for the first time.
func _ready():
	var k = 0
	for x in models:
		get_node("Panel/ModelButton").add_item(x,k)
		k+=1
	pickup  = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]["pickups"][Globals.working_index]
	model_node = get_node("Panel/ModelButton")
	pos["pos_x"] = get_node("Panel/Position/X Position")
	pos["pos_y"] = get_node("Panel/Position/Y Position")
	pos["pox_z"] = get_node("Panel/Position/Z Position")
	position_checkbox = get_node("Panel/Position/ChangePosition")
	pop_up_node = get_node("Panel/CheckBox")
	item_node = get_node("Panel/Selection/Item Selection")
	scan_node = get_node("Panel/Scan Text")
	memo_node = get_node("Panel/Pickup Text")
	currInc_node = get_node("Panel/currIncrease/amount")
	maxInc_node = get_node("Panel/maxIncrease/amount")
	item_node.select(items.find(pickup["type"], 0))
	scan_node.text =pickup["scanText"]
	memo_node.text = pickup["hudmemoText"]
	var i = 0
	for x in models:
		if x == pickup["model"]:
			model_node.select(i)
		else:
			i+=1
	maxInc_node.set_value(pickup["maxIncrease"])
	currInc_node.set_value(pickup["currIncrease"])
	respawn_node = get_node("Panel/CheckBox2")
	respawn_node.pressed = pickup["respawn"]
	

var checked
var pos_x
var pos_y 
var pos_z 
var model 
var scan
var acquisition 
var pop_up
var item
var currInc_node
var maxInc_node
var respawn_node
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_save_button_pressed():
	save_pickup()

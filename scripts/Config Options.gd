extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func setup():
	var i = 0
	$startingRoomArea.clear()
	for x in Globals.worlds:
		$startingRoomArea.add_item(x,i)
		i+=1
	for x in get_children():
		if x.get_class() != "Label":
			if x.get_class() == "CheckBox":
				if not Globals.working_layout["gameConfig"].has(x.get_name()):
					x.pressed = false
				else:
					x.pressed = Globals.working_layout["gameConfig"][x.get_name()]
			elif x.get_class() == "LineEdit":
				if Globals.working_layout["gameConfig"][x.get_name()] == null:
					x.text = "null"
				else:
					x.text = Globals.working_layout["gameConfig"][x.get_name()]
			elif x.get_class() == "SpinBox":
				x.set_value(Globals.working_layout["gameConfig"]["heatDamagePerSec"])
	var starting_room = Globals.working_layout["gameConfig"]["startingRoom"]
	var colon = starting_room.findn(":")
	var area = starting_room.substr(0,colon)
	var room = starting_room.substr(colon+1)
	$startingRoomArea.select(Globals.worlds.find(area))
	Globals.current_world = area
	$startingRoomArea.set_room_nodes()
	$startingRoomArea.room_select(room)
# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("setup")


var TextNodes = [
	"mainMenuMessage",
	"creditsString",
	"startingMemo"
]

func _on_SaveConfigOptions_pressed():
	for x in get_children():
		if x.get_class() == "LineEdit":
			var text
			if x.text == "null":
				text = null
			else:
				text = x.text 
			Json_Handler.Save_GameConfig_Change(x.get_name(),text)
		else:
			if x.get_name() == "HeatDamagePerSecond":
				Json_Handler.Save_GameConfig_Change("heatDamagePerSec", x.get_value())
			else:
				if x.get_class() == "CheckBox":
					Json_Handler.Save_GameConfig_Change(x.get_name(),x.pressed)
	var room = $startingRoomRoom.get_item_text($startingRoomRoom.get_selected_id())
	var area = $startingRoomArea.get_item_text($startingRoomArea.get_selected_id())
	var startingRoom = area+":"+room
	Json_Handler.Save_GameConfig_Change("startingRoom",startingRoom)


func _on_startingRoomArea_item_selected(index):
	var rooms = Globals.get_array(Globals.worlds[index])
	var i = 0
	$startingRoomRoom.clear()
	for x in rooms:
		$startingRoomRoom.add_item(x, i)
		i+=1
	

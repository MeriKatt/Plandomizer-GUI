extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_saveRoomOptions_pressed():
	var room = Globals.working_layout["levelData"][Globals.current_world]["rooms"][Globals.current_room]
	var RoomOptions = get_node("RoomOptions")
	Json_Handler.Save_Room_Changes(Globals.current_world,Globals.current_room,"drainLiquids",RoomOptions.get_node("drainLiquids").pressed )
	Json_Handler.Save_Room_Changes(Globals.current_world,Globals.current_room,"superheated",RoomOptions.get_node("superheated").pressed )

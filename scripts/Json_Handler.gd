extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func Save_GameConfig_Change(configOption, change):
	Globals.working_layout["gameConfig"][configOption] = change
	
func Save_Preferences_Change(preference, change):
	Globals.working_layout["preferences"][preference] = change

func Save_StartingItems_Change(item,value):
	Globals.working_layout["gameConfig"]["startingItems"][item] = value
	
func Save_Tweaks_Changes(changes):
	Globals.working_layout["tweaks"] = changes

func Save_Transporter_Changes(world, transporter, destination):
	Globals.working_layout["levelData"][world]["transports"][transporter] = destination

func Save_Room_Changes(world, room, changed_value, change):
	Globals.working_layout["levelData"][world]["rooms"][room][changed_value] = change

func Save_Room_Array_Changes(world, room, changed_value, index, change):
	Globals.working_layout["levelData"][world]["rooms"][room][changed_value][index] = change

func Save_Name_Change(name):
	Globals.working_layout["outputIso"] = ""+str(name)+".iso"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

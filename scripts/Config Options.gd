extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for x in get_children():
		if x.get_class() != "Label":
			if x.get_class() == "CheckBox":
				x.pressed = Globals.working_layout["gameConfig"][x.get_name()]
			elif x.get_class() == "LineEdit":
				if Globals.working_layout["gameConfig"][x.get_name()] == null:
					x.text = "null"
				else:
					x.text = Globals.working_layout["gameConfig"][x.get_name()]
			elif x.get_class() == "SpinBox":
				x.set_value(Globals.working_layout["gameConfig"]["heatDamagePerSec"])


var TextNodes = [
	"mainMenuMessage",
	"creditsString",
	"startingMemo",
	"startingRoom"
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

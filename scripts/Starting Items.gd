extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func setup():
	for x in get_children():
		if x.get_class() == "Control":
			x.get_node("amount").set_value(Globals.working_layout["gameConfig"]["startingItems"][x.get_name()])
		else:
			if x.get_class() != "Button":
				x.pressed = Globals.working_layout["gameConfig"]["startingItems"][x.get_name()]

# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("setup")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var number_input_fields = [
	"missiles",
	"powerBombs",
	"energyTanks"
]

func _on_saveStartingItemsButton_pressed():
	for x in get_children():
		if x.get_class() == "Control":
			print(x.get_name())
			Json_Handler.Save_StartingItems_Change(x.get_name(),x.get_node("amount").get_value())
		else:
			if x.get_class() != "Button":
				print(x.get_name())
				Json_Handler.Save_StartingItems_Change(x.get_name(), x.pressed)

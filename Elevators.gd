extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var elevators = [
	"Crater Entry Point",
	"Phendrana Drifts North (Phendrana Shorelines)",
	"Phendrana Drifts South (Quarantine Cave)",
	"Magmoor Caverns North (Lava Lake)",
	"Magmoor Caverns West (Monitor Station)",
	"Magmoor Caverns East (Twin Fires)",
	"Magmoor Caverns South (Magmoor Workstation, Debris)",
	"Magmoor Caverns South (Magmoor Workstation, Save Station)",
	"Phazon Mines East (Main Quarry)",
	"Phazon Mines West (Phazon Processing Center)",
	"Tallon Overworld North (Tallon Canyon)",
	"Artifact Temple",
	"Tallon Overworld East (Frigate Crash Site)",
	"Tallon Overworld West (Root Cave)",
	"Tallon Overworld South (Great Tree Hall, Upper)",
	"Tallon Overworld South (Great Tree Hall, Lower)",
	"Chozo Ruins West (Main Plaza)",
	"Chozo Ruins North (Sun Tower)",
	"Chozo Ruins East (Reflecting Pool, Save Station)",
	"Chozo Ruins South (Reflecting Pool, Far End)",
	"Frigate Escape Cutscene",
	"Essence Dead Cutscene",
	"Credits"
]
		
# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 1
	for x in elevators:
		add_item(x, i)
		i = i+1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

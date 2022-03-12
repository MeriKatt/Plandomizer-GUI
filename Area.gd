extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var worlds = [
	"Frigate Orpheon",
	"Tallon Canyon",
	"Chozo Ruins",
	"Magmoor Caverns",
	"Phendrana Drifts",
	"Phazon Mines",
	"Impact Crater"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 1
	for x in worlds:
		add_item(x,i)
		i += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

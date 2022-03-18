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


func _on_Save_button_pressed():
	get_node("FileDialog").popup()


func _on_FileDialog_file_selected(path):
	var file = File.new()
	var serial = JSON.print(Globals.working_layout, "\t")
	file.open(path, File.WRITE)
	file.store_string(serial)
	file.close()
		

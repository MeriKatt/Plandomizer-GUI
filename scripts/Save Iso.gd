extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var input
var output
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_input_file_selected(path):
	get_node("LineEdit").text = path
	input = path
	Globals.working_layout["inputIso"] = path

func _on_select_pressed():
	get_node("input").popup()


func _on_select_output_pressed():
	get_node("output").popup()


func _on_output_dir_selected(dir):
	output = dir
	get_node("LineEdit2").text = dir


func _on_Save_pressed():
	var json_path = "working_profile.json"
	var serial = JSON.print(Globals.working_layout, "\t")
	var file = File.new()
	file.open("./"+json_path, File.WRITE)
	file.store_string(serial)
	file.close()
	SaveIso.save(serial)


func _on_output_file_selected(path):
	output = path
	get_node("LineEdit2").text = path
	Globals.working_layout["outputIso"] = path

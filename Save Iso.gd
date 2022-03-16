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

func _on_select_pressed():
	get_node("input").popup()


func _on_select_output_pressed():
	get_node("output").popup()


func _on_output_dir_selected(dir):
	output = dir
	get_node("LineEdit2").text = dir


func _on_Save_pressed():
	pass # Replace with function body.


func _on_output_file_selected(path):
	output = path
	get_node("LineEdit2").text = path

extends FileDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Import_Button_pressed():
	popup()


func _on_FileDialog_file_selected(path):
	var default_file = File.new()
	var data_text
	var data_parse
	var data

	if default_file.open(path, File.READ) != OK:
		return
	data_text = default_file.get_as_text()
	data_parse = JSON.parse(data_text)
	if data_parse.error != OK:
		return
	data = data_parse.result
	Globals.working_layout = data
	print(Globals.working_layout)

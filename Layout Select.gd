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


func _on_Import_pressed():
	get_node("FileDialog").popup()


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
	if data.has("levelData") and data.has("gameConfig") and data.has("tweaks") and data.has("preferences"):
		Globals.working_layout = data
		get_node("WindowDialog2").popup()
	else:
		get_node("WindowDialog").popup()

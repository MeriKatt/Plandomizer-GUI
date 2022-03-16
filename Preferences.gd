extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var map_states = [
	"default",
	"visible",
	"visited"
]
var cutscene_options = [
	"original",
	"competitive",
	"minor",
	"major"
]
var hint_behaviors = [
	"default",
	"none",
	"all"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 0
	for x in cutscene_options:
		get_node("qolCutscenes/OptionButton").add_item(x, i)
		i+=1
	i = 0
	for x in hint_behaviors:
		get_node("artifactHintBehavior/OptionButton").add_item(x,i)
		i+=1
	i = 0
	for x in map_states:
		get_node("mapDefaultState/OptionButton").add_item(x,i)
		i+=1
	for x in get_children():
		if x.get_class() == "CheckBox":
			x.pressed = Globals.working_layout["preferences"][x.get_name()]
		elif x.get_class() != "Button":
			if x.get_name() == "qolCutscenes":
				var to_select = Globals.working_layout["preferences"]["qolCutscenes"]
				var index
				var l = 0
				for v in cutscene_options:
					if v == to_select:
						index = l
					else:
						l +=1
				x.get_node("OptionButton").select(l)
			elif x.get_name() == "artifactHintBehavior":
				var to_select = Globals.working_layout["preferences"]["artifactHintBehavior"]
				var index
				var l = 0
				for v in hint_behaviors:
					if v == to_select:
						index = l
					else:
						l +=1
				x.get_node("OptionButton").select(l)
			elif x.get_name() == "mapDefaultState":
				var to_select = Globals.working_layout["preferences"]["mapDefaultState"]
				var index
				var l = 0
				for v in map_states:
					if v == to_select:
						index = l
					else:
						l +=1
				x.get_node("OptionButton").select(l)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SavePreferences_pressed():
	for x in get_children():
		if x.get_class() == "CheckBox":
			Globals.working_layout["preferences"][x.get_name()] = x.pressed
		elif x.get_class() != "Button":
			var to_select 
			var index = x.get_node("OptionButton").get_selected_id()
			var l = 0
			var table
			if x.get_name() == "mapDefaultState":
				table = map_states
			elif x.get_name() == "artifactHintBehavior":
				table = hint_behaviors
			else:
				table = cutscene_options
			to_select = table[index]
			Globals.working_layout["preferences"][x.get_name()] = to_select

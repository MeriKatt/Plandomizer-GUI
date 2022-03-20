extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var elevator_selected
var area_selected
var room_selected
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Elevators_item_selected(index):
	pass # Replace with function body.

func destination_return():
	if typeof(elevator_selected) != TYPE_BOOL:
		return elevator_selected
	else:
		return area_selected+":"+room_selected

func _on_Button_pressed():
	elevator_selected = get_node("Panel/Elevators").get_item_text(get_node("Panel/Elevators").get_selected_id() -1)
	area_selected = get_node("Panel/Area").get_item_text(get_node("Panel/Area").get_selected_id() -1)
	room_selected = get_node("Panel/Room").get_item_text(get_node("Panel/Room").get_selected_id() -1)
	Json_Handler.Save_Transporter_Changes(Globals.elevators_world[get_node(".").get_parent().get_parent().cur_elev], get_node(".").get_parent().get_parent().cur_elev, destination_return())


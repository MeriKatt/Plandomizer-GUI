extends OptionButton


func set_room_nodes():
	var rooms = Globals.get_array(Globals.current_world)
	var room_node = get_parent().get_node("startingRoomRoom")
	var i = 0
	for x in rooms:
		room_node.add_item(x,i)
		i+=1
func room_select(room):
	var n = 0
	var room_node = get_parent().get_node("startingRoomRoom")
	while not room_node.get_item_text(n) == room:
		n+=1
	room_node.select(n)

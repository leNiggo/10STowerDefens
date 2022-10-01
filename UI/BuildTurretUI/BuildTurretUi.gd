extends CanvasLayer

func set_tower_preview(tower_type: String, mouse_position: Vector2): 
	var drag_tower = load("res://Scenes/Towers/" + tower_type + ".tscn").instantiate();
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("ad54ff3c")
	
	var controll = Control.new()
	controll.add_child(drag_tower, true)
	controll.position = mouse_position
	controll.set_name("TowerPreview")
	add_child(controll, true)
	move_child(get_node("TowerPreview"), 0)
	pass

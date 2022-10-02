extends CanvasLayer

func set_tower_preview(tower_type: String, mouse_position: Vector2): 
	var drag_tower = load("res://Scenes/Towers/" + tower_type + ".tscn").instantiate();
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("ad54ff3c")
	
	var controll: Control = Control.new()
	controll.add_child(drag_tower, true)
	controll.position = mouse_position
	controll.set_name("TowerPreview")
	add_child(controll, true)
	move_child(get_node("TowerPreview"), 0)
	pass

func update_tower_preview(new_pos: Vector2, color: Color):
	var tower_preview_node: Control = get_node("TowerPreview")
	tower_preview_node.position = new_pos
	if get_node("TowerPreview/DragTower").modulate != color:
		get_node("TowerPreview/DragTower").modulate = color;
	pass

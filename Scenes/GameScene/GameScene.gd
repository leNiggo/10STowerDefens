extends Node2D

var map_node: Node2D

var build_mode: bool = false;
var build_valid: bool = false;
var build_location: Vector2;
var build_type: String;


# Called when the node enters the scene tree for the first time.
func _ready():
	map_node = get_node("/root/LevelOne") # Replace this with an variable so it can be used to multiple maps
	spawn_enemy()
	for i in get_tree().get_nodes_in_group('build_turrets'):
		i.pressed.connect(initiate_build_mode.bind(i.name))

	pass


func initiate_build_mode(tower_type: StringName): 
	build_type = tower_type
	build_mode = true;
	get_parent().get_node('BuildTurretUi').set_tower_preview(build_type, get_global_mouse_position())
	pass


func _process(_delta):
	if build_mode:
		update_tower_preview()
	pass


func spawn_enemy():
	var new_enemy = preload("res://Scenes/Enemy/Enemy.tscn").instantiate()
	map_node.get_node('EnemyPath').add_child(new_enemy, true)
	pass


func update_tower_preview():
	var tile_node: TileMap = map_node.get_node("TileMap");
	var ui_node: CanvasLayer = get_parent().get_node("BuildTurretUi")


	var mouse_pos: Vector2 = get_global_mouse_position();
	var current_tile: Vector2i = tile_node.local_to_map(mouse_pos);
	var tile_pos: Vector2 = tile_node.map_to_local(current_tile);

	if tile_node.get_cell_source_id(0,current_tile) == -1:
		ui_node.update_tower_preview(tile_pos, "ad54ff3c")
		build_valid = true;
		build_location = tile_pos;

	else:
		ui_node.update_tower_preview(tile_pos, "adff45455")
		build_valid = false;
	pass

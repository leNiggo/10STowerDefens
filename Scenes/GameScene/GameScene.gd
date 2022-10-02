extends Node2D

var map_node: Node2D

var build_mode: bool = false;
var build_valid: bool = false;
var build_location: Vector2;
var build_type: String;

@onready var player: Control = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	map_node = get_node("/root/LevelOne") # Replace this with an variable so it can be used to multiple maps
	for i in get_tree().get_nodes_in_group('build_turrets'):
		i.pressed.connect(initiate_build_mode.bind(i.name))
	pass


func initiate_build_mode(tower_type: StringName) -> void: 
	build_type = tower_type
	build_mode = true;
	get_parent().get_node('BuildTurretUi').set_tower_preview(build_type, get_local_mouse_position())
	pass


func _process(_delta):
	if build_mode:
		update_tower_preview()
	pass

func _input(event: InputEvent):
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
	pass

func update_tower_preview() -> void:
	var tile_node: TileMap = map_node.get_node("TileMap");
	var ui_node: CanvasLayer = get_parent().get_node("BuildTurretUi")


	var mouse_pos: Vector2 = get_local_mouse_position();
	var current_tile: Vector2i = tile_node.local_to_map(mouse_pos);
	var tile_pos: Vector2 = tile_node.map_to_local(current_tile);

	if tile_node.get_cell_source_id(0,current_tile) != -1:
		ui_node.update_tower_preview(mouse_pos, Color.GREEN)
		build_valid = true;
		build_location = tile_pos;

	else:
		ui_node.update_tower_preview(mouse_pos, Color.RED)
		build_valid = false;
	pass

func cancel_build_mode() -> void:
	build_mode = false;
	build_valid = false;

	var tower_preview_node: Control = get_parent().get_node("BuildTurretUi/TowerPreview")
	tower_preview_node.queue_free()
	pass

func verify_and_build():
	if build_valid:
		## Here we check later if the player has enough money
		var new_tower_rec: PackedScene = load("res://Scenes/Towers/"+ build_type +".tscn");		
		var new_tower = new_tower_rec.instantiate()
		new_tower.position = build_location;
		new_tower.turret_build()
		map_node.get_node("Towers").add_child(new_tower);
	pass

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
		var callable = Callable(self, 'initiate_build_mode')
		callable.call(i.name)
		i.connect("pressed", callable)
		
	pass


func initiate_build_mode(tower_type: String): 
	build_type = tower_type
	build_mode = true;
	get_parent().get_node('BuildTurretUi').set_tower_preview(build_type, get_global_mouse_position())
	get_node('UI')
	pass


func _process(_delta):
	pass


func spawn_enemy():
	var new_enemy = preload("res://Scenes/Enemy/Enemy.tscn").instantiate()
	map_node.get_node('EnemyPath').add_child(new_enemy, true)
	pass


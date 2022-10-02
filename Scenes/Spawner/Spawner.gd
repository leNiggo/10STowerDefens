extends Node2D

var timer: Timer;
@export var path: Path2D;
@export var enemy: PackedScene;

@export var increase_per_spawn: int = 2;

var spawn_amount = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	timer.timeout.connect(spawn)
	pass


func spawn():
	for i in spawn_amount:
		var random_num = randf()
		path.add_child(enemy.instantiate())	
		await get_tree().create_timer(random_num).timeout
	spawn_amount += increase_per_spawn;
	pass

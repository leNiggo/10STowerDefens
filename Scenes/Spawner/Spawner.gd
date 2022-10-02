extends Node2D

var timer: Timer;
@export var path: Path2D;
@export var enemy: PackedScene;
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	timer.timeout.connect(spawn)
	pass


func spawn():
	path.add_child(enemy.instantiate())	
	pass

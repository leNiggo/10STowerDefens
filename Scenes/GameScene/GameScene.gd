extends Node2D

var map_node: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	map_node = get_node("/root/LevelOne")
	spawn_enemy()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func spawn_enemy():
	var new_enemy = preload("res://Scenes/Enemy/Enemy.tscn").instantiate()
	map_node.get_node('EnemyPath').add_child(new_enemy, true)
	pass



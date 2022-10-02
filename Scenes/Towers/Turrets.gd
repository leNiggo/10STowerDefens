extends Node2D


var turret: Sprite2D;
var enemys: Array[Node2D] = [];
var build: bool = true;
var enemy: PathFollow2D;

func _ready():
	turret = get_node("Turret")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if build and enemys.size() > 0:
		select_enemy()
		turn_turret()
	else:
		enemy = null;
	pass


func turn_turret() -> void:
	turret.look_at(enemy.position)

func select_enemy(): 
	var enemy_progress_array = []
	for e in enemys:
		enemy_progress_array.append(e.progress)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemys[enemy_index]
	pass

func _on_range_body_entered(body: Node):
	enemys.append(body.get_parent())
	pass # Replace with function body.


func _on_range_body_exited(body: Node):
	enemys.erase(body.get_parent())
	pass # Replace with function body.

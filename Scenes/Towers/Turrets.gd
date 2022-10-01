extends Node2D


var turret: Sprite2D

func _ready():
	turret = get_node("Turret")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	turn_turret()
	pass



func turn_turret():
	# Tracking mouse position
	var enemy_pos = get_global_mouse_position(); # Replace this with the enemy position
	turret.look_at(enemy_pos)

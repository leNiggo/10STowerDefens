extends Node2D


@export_range(0, 100) var live: int = 50;
@export_range(0, 1000) var damage: int = 50;
@export_range(0, 100) var speed: int = 20;

var tile_map: TileMap;

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass

extends PathFollow2D


@export_range(0, 100) var live: int = 50;
@export_range(0, 1000) var damage: int = 50;
@export_range(0, 100) var speed: int = 50;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	progress += _delta * speed
	pass

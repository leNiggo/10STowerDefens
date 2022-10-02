extends PathFollow2D

@export_range(0, 100) var live: float = 100.0;
@export_range(0, 1000) var damage: int = 50;
@export_range(0, 100) var speed: int = 50;

@onready var health_bar: TextureProgressBar = get_node("HealthBar") 


# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.max_value = live
	health_bar.value = live
	print(health_bar.value)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	progress += _delta * speed
	print(health_bar.value)

	pass

func on_hit(hit: int):
	live -= hit;
	health_bar.value = live;
	if live < 0:
		on_destroy()
	pass

func on_destroy():
	self.queue_free()

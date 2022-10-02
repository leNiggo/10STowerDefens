extends Camera2D

@export var scroll_speed: int = 100; 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	if Input.is_action_pressed("ui_up"):
		position += Vector2(0, -1) * scroll_speed * delta
	if Input.is_action_pressed("ui_down"):
		position += Vector2(0, 1) * scroll_speed * delta
	if Input.is_action_pressed("ui_right"):
		position += Vector2(1, 0) * scroll_speed * delta
	if Input.is_action_pressed("ui_left"):
		position += Vector2(-1, 0) * scroll_speed * delta
	
	pass

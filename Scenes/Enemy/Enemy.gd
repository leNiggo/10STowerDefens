extends PathFollow2D

@export_range(0, 100) var live: float = 100.0;
@export_range(0, 1000) var damage: int = 50;
@export_range(0, 100) var speed: int = 50;

@onready var health_bar: TextureProgressBar = get_node("HealthBar") 
@onready var player: Control = get_parent().get_parent().get_node("Player")
@onready var texture: Sprite2D = $EnemyChar/EnemyTexture
@onready var explosion_particle: GPUParticles2D = $Explosion

# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.max_value = live
	health_bar.value = live
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	progress += _delta * speed
	if progress_ratio == 1.0:
		player.lose_live()
		queue_free()
	pass

func on_hit(hit: float):
	texture.material.set_shader_parameter("flash", true)
	live -= hit;
	health_bar.value = live;
	
	if live <= 0:
		player.earn_money(20)
		explode()
		await get_tree().create_timer(.3).timeout
		self.queue_free()
	
	await get_tree().create_timer(0.5).timeout
	texture.material.set_shader_parameter("flash", false)

	pass
func explode(): 
	explosion_particle.emitting = true
	pass

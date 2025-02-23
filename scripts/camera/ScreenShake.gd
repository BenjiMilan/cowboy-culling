extends Node

@export var camera : Camera2D
@export var decay : float
@export var max_offset : Vector2
@export var max_roll : float

var noise : FastNoiseLite = FastNoiseLite.new()
var magnitude : float = 0.0
var magnitude_power : float = 2
var noise_y : int = 0

func _ready() -> void:
	EventBus.connect("screen_shake", _on_screen_shake)
	
	randomize()
	
	noise.seed = randi()
	noise.fractal_octaves = 4
	noise.fractal_lacunarity = 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	magnitude = max(magnitude - decay * delta, 0)
	shake()

func _on_screen_shake(magnitude_impulse : float):
	magnitude = min(magnitude + magnitude_impulse, 1.0)

func shake():
	noise_y += 1
	var amount = pow(magnitude, magnitude_power)
	camera.rotation = max_roll * amount * noise.get_noise_2d(-1000, noise_y)
	camera.offset.x = max_offset.x * amount * noise.get_noise_2d(0, noise_y)
	camera.offset.y = max_offset.y * amount * noise.get_noise_2d(1000, noise_y)
	if noise_y >= 1000000:
		noise_y = 0

	

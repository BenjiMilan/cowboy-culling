extends Node

var bullet_scenes = {
	"normal": preload("res://scenes/bullets/normal_bullet.tscn")
}

var pools = {}

func _ready() -> void:
	for bullet_type in bullet_scenes.keys():
		pools[bullet_type] = []
		for i in range(100):
			var bullet = bullet_scenes[bullet_type].instantiate() as Bullet
			bullet.deactivate()
			add_child(bullet)
			pools[bullet_type].append(bullet)

func get_bullet(bullet_type: String):
	if not pools.has(bullet_type):
		push_error("Bullet type not found: " + bullet_type)
		return null
	for bullet in pools[bullet_type]:
		if not bullet.active:
			bullet.activate()
			return bullet
	var new_bullet = bullet_scenes[bullet_type].instantiate() as Bullet
	add_child(new_bullet)
	pools[bullet_type].append(new_bullet)
	return new_bullet

func return_bullet(bullet: Bullet):
	bullet.deactivate()

class_name WepProjectileComponent
extends Node2D

@export var bullet_component : BulletComponent

var bullet: Bullet

func fire_bullet(spawn_position: Vector2, direction: Vector2) -> Bullet:
	bullet = BulletPool.get_bullet(bullet_component.bullet_resource.type)
	bullet.global_position = spawn_position
	bullet.linear_velocity = bullet_component.bullet_resource.speed * direction.normalized()
	bullet.freeze = false
	bullet.set_bullet_resource(bullet_component.bullet_resource)
	return bullet

class_name KnockbackComponent
extends Node

@export var velocity_component : VelocityComponent
@export var knockback_decay : float = 0.5
var knockback_velocity : Vector2 = Vector2(0,0)

func _physics_process(delta: float) -> void:
	if knockback_velocity.length() < 0.05:
		knockback_velocity = Vector2(0,0)
		return
		
	knockback_velocity = knockback_velocity.lerp(Vector2.ZERO, 1 - exp(-knockback_decay))
	velocity_component.apply_external_force(knockback_velocity)

func apply_knockback(direction: Vector2, force: float) -> void:
	knockback_velocity += direction.normalized() * force

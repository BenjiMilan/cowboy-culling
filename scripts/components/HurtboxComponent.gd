class_name HurtboxComponent
extends Area2D

@export var health_component : HealthComponent
@export var knockback_component : KnockbackComponent

func damage(attack: AttackComponent):
	if health_component:
		health_component.damage(attack.attack_resource.damage)
	
	if knockback_component:
		knockback_component.apply_knockback(attack.attack_position, attack.knockback_force)

class_name Pistol
extends Weapon

@export var muzzle: Marker2D
@export var wep_projectile_component: WepProjectileComponent
@export var attack_component: AttackComponent

var bullet: Bullet

func fire():
	if reload_timer.is_stopped():
		reload_timer.start()
		bullet = wep_projectile_component.fire_bullet(
			muzzle.global_position, 
			muzzle.global_position - global_position,
			)
		if attack_component:
			bullet.set_attack_data(attack_component.attack_resource)
		EventBus.emit_signal("screen_shake", weapon_resource.screen_shake)
		emit_signal("fired")

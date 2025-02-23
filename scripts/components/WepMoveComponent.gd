class_name WepMoveComponent
extends Node2D

var weapon_angle : float = 0.0
var aim_direction : Vector2
var target_angle : float


func move_weapon(character_body: CharacterBody2D, weapon: Weapon):
	aim_direction = (get_global_mouse_position() - character_body.global_position).normalized()
	target_angle = aim_direction.angle()
	
	weapon_angle = lerp(weapon_angle, target_angle, weapon.weapon_resource.aim_speed)
	
	var new_x = character_body.global_position.x + weapon.weapon_resource.distance_from_user * cos(weapon_angle)
	var new_y = character_body.global_position.y + weapon.weapon_resource.distance_from_user * sin(weapon_angle)

	weapon.global_position = Vector2(new_x, new_y)
	weapon.rotation = weapon_angle
	
	if weapon_angle > -PI / 2 and weapon_angle < PI / 2:
		weapon.scale.y = abs(scale.y)  # Face right
	else:
		weapon.scale.y = -abs(scale.y)  # Face left

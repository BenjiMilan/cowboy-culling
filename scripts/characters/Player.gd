class_name Player
extends CharacterBody2D

@export var wep_move_component: WepMoveComponent
@export var knockback_component: KnockbackComponent
@export var player_movement_component: PlayerMovementComponent
@export var starting_weapon: Weapon

var move_dir : Vector2 = Vector2(0,0)
var weapon : Weapon

func _ready() -> void:
	equip_weapon(starting_weapon)

func _physics_process(delta: float) -> void:
	wep_move_component.move_weapon(self, weapon)
	if Input.is_action_just_pressed("click"):
		weapon.fire()
	player_movement_component.move_player(self)

func equip_weapon(new_weapon: Weapon):
	if weapon:
		weapon.disconnect("fired", _on_weapon_fired)
	weapon = new_weapon
	weapon.connect("fired", _on_weapon_fired)

func _on_weapon_fired():
	knockback_component.apply_knockback(
		global_position - weapon.global_position,
		weapon.weapon_resource.knockback
	)

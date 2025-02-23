class_name Weapon
extends Node2D

@export var weapon_resource: WeaponResource
@export var reload_timer : Timer

signal fired

func _ready():
	reload_timer.wait_time = weapon_resource.reload_time

func fire():
	push_error("Weapons fire function must be overridden")

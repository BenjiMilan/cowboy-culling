class_name HealthComponent
extends Node

@export var MAX_HEALTH : float = 100.0
var health : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH

func damage(damage_amount: float):
	health -= damage_amount
	if health <= 0:
		get_parent().queue_free()
	

class_name VelocityComponent
extends Node

@export var max_speed : float = 300
@export var acceleration_coefficent : float = 10

var acceleration_coefficient_multiplier : float = 1

var movement_velocity : Vector2
var external_force : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move(character_body: CharacterBody2D):
	character_body.velocity = movement_velocity + external_force
	character_body.move_and_slide()
	external_force = Vector2(0,0)

func accelerate_to_velocity(target_velocity: Vector2):
	movement_velocity = movement_velocity.lerp(target_velocity, 1 - exp(-acceleration_coefficent * acceleration_coefficient_multiplier))

func decelerate():
	accelerate_to_velocity(Vector2(0,0))

func apply_external_force(force: Vector2):
	external_force += force
	

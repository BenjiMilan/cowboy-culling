class_name PlayerMovementComponent
extends Node

@export var velocity_component : VelocityComponent

var move_dir : Vector2

func move_player(player: CharacterBody2D):
	move_dir = _get_move_dir()
	velocity_component.accelerate_to_velocity(velocity_component.max_speed * move_dir)
	velocity_component.move(player)

func _get_move_dir():
	var move_y = 0
	var move_x = 0
	if Input.is_action_pressed("move_up"):
		move_y += -1
	if Input.is_action_pressed("move_down"):
		move_y += 1
	if Input.is_action_pressed("move_right"):
		move_x += 1
	if Input.is_action_pressed("move_left"):
		move_x += -1
	
	return Vector2(move_x, move_y).normalized()

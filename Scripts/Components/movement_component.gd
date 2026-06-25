@icon("res://addons/at-icons/node2d/arrow_cross.svg")

class_name MovementComponent
extends Node

## EXPORTS
@export_group("Movement")
@export var speed : float = 200.0
@export var acceleration : float = 1200.0
@export var friction : float = 1200.0

## INTERNAL
var velocity : Vector2 = Vector2.ZERO

## METHODS
func _apply_linear_movement(input_direction: Vector2) -> Vector2:
	var target_velocity = input_direction.normalized() * speed
	
	if input_direction != Vector2.ZERO:
		return velocity.move_toward(target_velocity, speed)
	else:
		return velocity.move_toward(Vector2.ZERO, speed)

func _apply_progressive_movement(delta: float, input_direction: Vector2) -> Vector2:
	velocity = velocity.limit_length(speed)
	if input_direction != Vector2.ZERO:
		velocity += input_direction * acceleration * delta
		return velocity
	else:
		velocity *= friction * delta
		return velocity

## UTILITIES
func reset() -> void:
	velocity = Vector2.ZERO

func set_custom_saf(new_speed : float, new_acceleration : float, new_friction : float) -> void:
	speed = new_speed
	acceleration = new_acceleration
	friction = new_friction
	
	
	

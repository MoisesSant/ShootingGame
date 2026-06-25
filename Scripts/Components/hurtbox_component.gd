@icon("res://addons/at-icons/node2d/bandages.svg")
class_name HurtboxComponent
extends Area2D

## SIGNALS
signal recieve_hit()

## EXPORTS
@export var collision: CollisionShape2D

## METHODS


func _on_area_entered(area: Area2D) -> void:
	if not area is HitboxComponent:
		return
	recieve_hit.emit()
	

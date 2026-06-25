@icon("res://addons/at-icons/node2d/axe.svg")
class_name HitboxComponent

extends Area2D
signal hit(Hurtbox: HurtboxComponent)

@export var damage : float
@export var one_shot: bool

var _has_hit : bool = false
func _init() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if not area is HurtboxComponent:
		return
	hit.emit()

func reset() -> void:
	_has_hit = false

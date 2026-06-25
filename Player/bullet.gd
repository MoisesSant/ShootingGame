extends Node2D

const SPEED: float = 500.0
var able_to_delete: bool = false
@onready var anim_player: AnimationPlayer = %Animation
@onready var explosion_eff: CPUParticles2D = %ExplosionEffect
@onready var explosionTime: Timer = %ExplosionTimer

func _ready() -> void:
	add_to_group("Bullets")
	anim_player.play("appear")

func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
	if able_to_delete:
		queue_free()

func _on_distance_timeout_timeout():
	anim_player.play("remove")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "remove":
		explosion_eff.reparent(get_tree().current_scene)
		explosion_eff.global_position = global_position
		explosion_eff.emitting = true
		able_to_delete = true
		queue_free()

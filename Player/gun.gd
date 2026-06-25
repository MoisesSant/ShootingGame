extends Node2D

const BULLET = preload("res://Player/bullet.tscn")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = %shoot_pos.global_position
		bullet_instance.global_rotation = %shoot_pos.global_rotation + PI / 2
		

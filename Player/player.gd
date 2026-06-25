extends CharacterBody2D

@onready var movement: MovementComponent = $MovementComponent

func _ready() -> void:
	movement.set_custom_saf(100.0, 350.0, 50.0)

func _physics_process(delta: float) -> void:
	var player_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement._apply_progressive_movement(delta, player_dir)
	look_to_mouse(delta)
	move_and_slide()

func look_to_mouse(delta : float) -> void:
	var mouse_dir = get_global_mouse_position()
	var look_to_mouse_dir = mouse_dir - global_position
	var rotation_speed : float = 10
	
	if mouse_dir == Vector2.ZERO:
		return
	
	var target_dir = (
		look_to_mouse_dir.angle() + PI / 2
	)
	
	rotation = lerp_angle(
		rotation,
		target_dir,
		rotation_speed * delta
	)

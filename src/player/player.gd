extends CharacterBody2D

const SPEED = 300.0

func _enter_tree():
	set_multiplayer_authority(str(name).to_int())

func _physics_process(_delta: float):
	if is_multiplayer_authority():
		var direction = Input.get_vector("control_left", "control_right", "control_up", "control_down")
		velocity = direction * SPEED
		move_and_slide()

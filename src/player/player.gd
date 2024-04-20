extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta: float):
	var direction = Input.get_vector("control_left", "control_right", "control_up", "control_down")
	velocity = direction * SPEED
	move_and_slide()

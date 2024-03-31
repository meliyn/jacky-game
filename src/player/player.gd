class_name Player
extends CharacterBody3D


const SPEED = 5.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var inventory: Array[int] = []


func _physics_process(delta: float):
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input_dir = Input.get_vector("control_left", "control_right", "control_up", "control_down")
	var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		look_at(position + direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

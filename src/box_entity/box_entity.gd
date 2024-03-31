class_name BoxEntity
extends CharacterBody3D

@export var id: int = 0;

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta: float):
	if not is_on_floor():
		velocity.y -= gravity * delta
	move_and_slide()


func _on_area_3d_body_entered(body: Node3D):
	if body is Player:
		body.inventory.append(id)
		queue_free()

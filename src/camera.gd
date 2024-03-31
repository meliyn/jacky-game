class_name Camera
extends Camera3D

static var instance: Camera = null

@export var player: Player = null

func _init():
	instance = self

func _process(_delta: float):
	if player != null:
		global_position = player.global_position + Vector3(0, 3, 5)
		look_at(player.global_position)

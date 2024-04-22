class_name Game
extends Node2D

static var instance: Game = null

func _ready() -> void:
	instance = self

func spawn_player(id: int) -> void:
	var new_player = preload ("res://src/player/player.tscn").instantiate()
	new_player.name = str(id)
	add_child(new_player, true)

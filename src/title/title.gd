extends Control

func _on_multiplayer_host_button_pressed():
	Main.instance.multiplayer_host()
	Main.instance.add_child(preload ("res://src/game/game.tscn").instantiate())

func _on_multiplayer_join_button_pressed():
	Main.instance.multiplayer_join("127.0.0.1")

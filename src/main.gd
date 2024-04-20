class_name Main
extends Node

static var instance: Main = null

func _ready() -> void:
	instance = self

	# multiplayer.peer_connected.connect(_on_player_connected)
	# multiplayer.peer_disconnected.connect(_on_player_disconnected)
	multiplayer.connected_to_server.connect(_on_connection_success)
	multiplayer.connection_failed.connect(_on_connection_fail)
	multiplayer.server_disconnected.connect(_on_disconnected)

	if DisplayServer.get_name() == "headless":
		multiplayer_host()

func multiplayer_host() -> void:
	print("Creating server...")
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(1030)
	if error != OK:
		printerr("Failed to create server.")
	else:
		print("Created server.")
		multiplayer.multiplayer_peer = peer

func multiplayer_join(address: String) -> void:
	print("Creating client...")
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(address, 1030)
	if error != OK:
		printerr("Failed to create client.")
	else:
		print("Created client.")
		multiplayer.multiplayer_peer = peer

func _on_connection_success() -> void:
	print("Connected to server.")

func _on_connection_fail() -> void:
	printerr("Failed to connect to server.")

func _on_disconnected() -> void:
	print("Disconnected from server.")

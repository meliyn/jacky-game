extends Area3D

func _on_body_exited(_body: Node3D):
	DropOffUi.instance.hide()

func _on_body_entered(_body: Node3D):
	DropOffUi.instance.show()

extends Node

func _on_area_entered(_body : Node2D):
	_body.call("restart")

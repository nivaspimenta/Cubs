extends StaticBody2D

enum plt {PLT = 0, CCH = 1, BRD = 2, END = 3}

@export var sprite : Sprite2D
@export var type_plt : plt
@export var nl : PackedScene
@export var cor : Color = Color(1,1,1)

func _ready():
	modulate = cor

func _on_area_entered(_body : Node2D):
	match type_plt:
		0:
			var color = str(_body.get_node("sprite").modulate.to_html())
			if color != str(cor.to_html()):
				_body.call("restart")
		1:
			_body.get_node("sprite").modulate = modulate
		2:
			_body.call("restart")
		3:
			var color = str(_body.get_node("sprite").modulate.to_html())
			if color != str(cor.to_html()):
				_body.call("restart")
			else:
				if nl != null:
					call_deferred("next_level")
				else:
					call_deferred("back_to_menu")

func next_level():
	get_tree().change_scene_to_packed(nl)

func back_to_menu():
	get_tree().change_scene_to_file("res://Scenes/Levels/MainMenu.tscn")


extends Node

enum GAMESTATE {PLAY, MENU}

@export var GS : GAMESTATE = GAMESTATE.MENU

func _ready():
	if get_tree().get_current_scene().get_name() != "main":
		GS = GAMESTATE.PLAY
	else:
		GS = GAMESTATE.MENU

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("jump") and GS == GAMESTATE.MENU:
		GS = GAMESTATE.PLAY
		get_tree().change_scene_to_file("res://Scenes/Levels/level1.tscn")
	elif Input.is_action_just_pressed("back") and GS == GAMESTATE.PLAY:
		GS = GAMESTATE.MENU
		get_tree().change_scene_to_file("res://Scenes/Levels/MainMenu.tscn")

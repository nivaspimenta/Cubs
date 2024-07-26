extends CharacterBody2D

@export_range(50, 200, 0.1) var speed : float
@export_range(-800, 50, 5) var jumpSpeed : float 
@export_range(100, 2000, 10) var gravity : float
@export var sprite : Sprite2D
@export var startPosition : Vector2
@export var audiodeath : AudioStreamMP3
@export var audiojump : AudioStreamMP3
@export var audioStreamer : AudioStreamPlayer

func _ready():
	startPosition = position

func restart():
	audioStreamer.stream = audiodeath
	audioStreamer.play()
	sprite.modulate = Color(1,1,1)
	position = startPosition

func _physics_process(delta):
	
	velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpSpeed
		audioStreamer.stream = audiojump
		audioStreamer.play()

	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed

	move_and_slide()
	

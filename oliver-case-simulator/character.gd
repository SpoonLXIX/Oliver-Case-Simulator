extends CharacterBody2D
@export var speed = 100
@onready var current_dir = "Down"


func _process(delta: float) -> void:
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("W"):
		current_dir = "Up"
		velocity.y = -speed
		velocity.x = 0
		play_animation("Up")
	elif Input.is_action_pressed("A"):
		current_dir = "Left"
		velocity.x = -speed
		velocity.y = 0
		play_animation("Left")
	elif Input.is_action_pressed("S"):
		current_dir = "Down"
		velocity.y = speed
		velocity.x = 0
		play_animation("Down")
	elif Input.is_action_pressed("D"):
		current_dir = "Right"
		velocity.x = speed
		velocity.y = 0
		play_animation("Right")
	else:
		velocity.x = 0
		velocity.y = 0
		play_animation("Still")
	move_and_slide()
		
		
func play_animation(direction):
	if direction == "Up":
		pass
		### Play Move Animations Here.
		

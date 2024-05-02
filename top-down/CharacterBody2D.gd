extends CharacterBody2D

const speed = 200
var current_direction = "none"

func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("move_right"):
		current_direction = "right"
		play_animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("move_left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("move_down"):
		current_direction = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("move_up"):
		current_direction = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_animation(movement):
	var dir = current_direction
	var anims = $AnimatedSprite2D
	
	if dir == "right":
		anims.flip_h = true
		if movement == 1:
			anims.play("walk")
		elif movement == 0:
			anims.play("idle")
	if dir == "left":
		anims.flip_h = false
		if movement == 1:
			anims.play("walk")
		elif movement == 0:
			anims.play("idle")
	if dir == "down":
		if movement == 1:
			anims.play("walk")
		elif movement == 0:
			anims.play("idle")
	if dir == "up":
		if movement == 1:
			anims.play("walk")
		elif movement == 0:
			anims.play("idle")
			
	
	
	

extends CharacterBody2D

const speed = 200
var current_direction = "none"

var corpse_in_range = false

func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	if corpse_in_range == true:
		if Input.is_action_just_pressed("ui_accept") && global.isInDialogue == false:
			if Dialogic.current_timeline != null:
				return
			
			Dialogic.start('timeline1')
			return
	
	player_movement(delta)
	if Input.is_action_pressed("mouse_left"):
		var vel: Vector2 = (get_global_mouse_position() - global_position).normalized() * 200
		velocity = vel
		move_and_slide()
	
func player_movement(delta):
	if global.isInDialogue == true:
		return
	
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
			
	
	
	


func _on_detection_area_body_entered(body):
	if body.has_method("transpBlockFunc"):
		corpse_in_range = true
		print("?!?!??!")
	if body.has_method("a2DStuff"):
		print("ENTERERED ")
		


func _on_detection_area_body_exited(body):
	if body.has_method("transpBlockFunc"):
		corpse_in_range = false



func _on_new_scene_body_entered(body):
	get_tree().change_scene_to_file("res://world.tscn")

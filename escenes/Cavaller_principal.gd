extends CharacterBody2D

var vel_salt := Vector2.UP * 500
var direccio := Vector2(0, 0)
var velocitat_maxima = 200
var atacar:bool = false
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):

	direccio = Vector2(0,0)
	velocity.x = 0
	velocity.y = 0
	if (velocity.x > 1 or velocity.x < -1) or (velocity.y > 1 or velocity.y < -1):
		animated_sprite_2d.play("Running")
	else:
		animated_sprite_2d.animation = "Idle"
		
	if Input.is_action_pressed("Right"):
		direccio.x += 1
	if Input.is_action_pressed("Left"):
		direccio.x += -1
	if Input.is_action_pressed("Down"):
		direccio.y += 1
	if Input.is_action_pressed("Up"):
		direccio.y += -1
	if Input.is_action_just_pressed("atac"):
		animated_sprite_2d.play("atac2")
		atacar = true
	velocity += direccio.normalized() * velocitat_maxima 
	move_and_slide()
	
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft

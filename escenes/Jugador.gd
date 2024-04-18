extends CharacterBody2D


var gravetat := Vector2.DOWN * 900
var vel_salt := Vector2.UP * 500
var direccio := Vector2(0, 0)
var velocitat_maxima = 200
@onready var animated_sprite_2D = $AnimatedSprite2D


func _physics_process(delta):
	# Add the gravity.
	if (velocity.x > 1 or velocity.x < -1):
		pass
		#animated_sprite_2D.animation = "Run"
	else:
		#animated_sprite_2D.animation = "default"
		pass

	# Handle jump.
	direccio = Vector2(0, 0)
	velocity.x = 0
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity += vel_salt
		
	if Input.is_action_pressed("Left"):
		direccio.x += -1
	if Input.is_action_pressed("Right"):
		direccio.x += 1
	velocity += gravetat * delta
	velocity += direccio.normalized() * velocitat_maxima
	move_and_slide()
	
	var isLeft = velocity.x < 0
	animated_sprite_2D.flip_h = isLeft

extends CharacterBody2D


#var gravetat := Vector2.DOWN * 900
var vel_salt := Vector2.UP * 500
var direccio := Vector2(0, 0)
var velocitat_maxima = 200
@onready var animated_sprite_2D = $AnimatedSprite2D
@onready var point_light_2d = $PointLight2D


func _physics_process(delta):
	# Add the gravity.
	#animated_sprite_2D.play("default")
	if (velocity.x > 1 or velocity.x < -1) or (velocity.y > 1 or velocity.y < -1):
		animated_sprite_2D.play("Running")
	else:
		animated_sprite_2D.animation = "default"
		
	# Handle jump.
	direccio = Vector2(0, 0)
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("Up"):
		#velocity += vel_salt
		direccio.y += -1
	if Input.is_action_pressed("Left"):
		direccio.x += -1
	if Input.is_action_pressed("Right"):
		direccio.x += 1
	if Input.is_action_pressed("Down"):
		direccio.y += 1
	#velocity += gravetat * delta
	velocity += direccio.normalized() * velocitat_maxima
	move_and_slide()
	for i in range(1, 100):
		point_light_2d.energy -= 0.0001
		
	
	var isLeft = velocity.x < 0
	animated_sprite_2D.flip_h = isLeft

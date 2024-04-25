extends CharacterBody2D


#var gravetat := Vector2.DOWN * 900
var vel_salt := Vector2.UP * 500
var direccio := Vector2(0, 0)
var velocitat_maxima = 200
var atacar:bool = false
@onready var animated_sprite_2D = $AnimatedSprite2D
@onready var point_light_2d = $PointLight2D
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
@onready var hit_box_character = $AnimatedSprite2D2/HitBoxCharacter


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
	if Input.is_action_just_pressed("atac"):
		$AnimatedSprite2D2.play("Slash")
		atacar = true
		
	#velocity += gravetat * delta
	
		
	velocity += direccio.normalized() * velocitat_maxima
	move_and_slide()
	for i in range(1, 100):
		point_light_2d.energy -= 0.00001
		if point_light_2d.energy == 0:break
		
	
	var isLeft = velocity.x < 0
	animated_sprite_2D.flip_h = isLeft
	animated_sprite_2d_2.flip_h = isLeft

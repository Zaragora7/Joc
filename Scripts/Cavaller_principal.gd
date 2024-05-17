extends CharacterBody2D

var vel_salt := Vector2.UP * 500
var direccio := Vector2(0, 0)
var velocitat_maxima = 200
var atacar:bool = false
var tinc_clau := false
var vides := 5:
	set(noves_vides):
		vides = noves_vides
		Global.canvia_vides(vides)
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_atac = $HitBoxAtac/CollisionShape2D
@onready var point_light_2d = $PointLight2D
var kickback_strength := 50
var kickback = false
var was_moving = false
var acabat = false
func _physics_process(delta):

	direccio = Vector2(0,0)
	velocity.x = 0
	velocity.y = 0
	if not kickback:
		if Input.is_action_pressed("Right") and atacar == false:
			direccio.x += 10
		if Input.is_action_pressed("Left") and atacar == false:
			direccio.x += -10
		if Input.is_action_pressed("Down") and atacar == false:
			direccio.y += 10
		if Input.is_action_pressed("Up") and atacar == false:
			direccio.y += -10
		if Input.is_action_just_pressed("atac"):
			direccio = Vector2(0,0)
			_atac()
		velocity += direccio.normalized() * velocitat_maxima 
	move_and_slide()
	
	
	
	#if velocity.length_squared() == 0 and not atacar:
	
	var is_moving = velocity.x != 0 or velocity.y != 0
	if not is_moving and not atacar:
		$AnimatedSprite2D.play("Idle")
		if was_moving:
			$Run.stop()
	elif is_moving:
		$AnimatedSprite2D.play("Running")
		if not was_moving:
			$Run.play()
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	was_moving = is_moving
	
	
	#if velocity.x == 0 and velocity.y == 0 and not atacar:
	
	#	$AnimatedSprite2D.play("Idle")
	#	$Run.stop()
	
	#elif velocity.x != 0 or velocity.y != 0:

	#	$AnimatedSprite2D.play("Running")
	#	$Run.play()
	#if velocity.x < 0:
	#	$AnimatedSprite2D.flip_h = true
	#elif velocity.x > 0:
	#	$AnimatedSprite2D.flip_h = false
	###########################################################3
	
	#if velocity.length_squared() == 0 and not atacar:
		#$AnimatedSprite2D.play("Idle")
	#elif velocity.x < 0:
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("Running")
		#$Run.play()
	#elif velocity.x > 0:
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("Running")
	#elif velocity.y < 0:
		#$AnimatedSprite2D.play("Running")
		#$Run.play()
	#elif velocity.y > 0:
		#$AnimatedSprite2D.play("Running")
		#$Run.play()
		
	#else:
	#	$AnimatedSprite2D.play("Idle")
func _atac():
	$Espasa.play()
	$AnimatedSprite2D.play("atac2")
	collision_shape_atac.set_deferred("disabled", false)
	atacar = true
	if $AnimatedSprite2D.flip_h:
		$HitBoxAtac.position.x = -59
	else:
		$HitBoxAtac.position.x = 59
	await $AnimatedSprite2D.animation_finished
	atacar = false
	

		
		
		
	#if (velocity.x > 10 or velocity.x < -10) or (velocity.y > 10 or velocity.y < -10):
		#$AnimatedSprite2D.play("Running")
	#else:
		#animated_sprite_2d.play("Idle")
		#pass
	#var isLeft = velocity.x < 0
	#animated_sprite_2d.flip_h = isLeft
	
		
func _on_animated_sprite_2d_animation_finished():
	print("Has atacat")
	animated_sprite_2d.play("Idle")
	if animated_sprite_2d.animation == "Idle":
		collision_shape_atac.set_deferred("disabled", true)
		atacar = false


func _atac_acabat():
	atacar = false


func _on_hit_box_atac_area_entered(area):
	acabat = false
	if area.has_method("mort"):
		area.mor()
	if area.is_in_group("enemics"):
		print(area.name)
		$death_mage.play()
		area.queue_free()
		

func guanya_clau():
	print("Tinc una clau!")
	$clau.play()
	tinc_clau = true

func mal(pos_enemic):
	vides -= 1
	$take_damage.play()
	print("Au!")
	if vides == 0:
		self.mor()
	else:
		var direccio = -global_position.direction_to(pos_enemic)
		kickback = true
		var tween = create_tween()
		tween.tween_property(self, "global_position", global_position + direccio*kickback_strength, 0.2).set_trans(Tween.TRANS_EXPO)
		tween.finished.connect(kickback_acabat)
	
func kickback_acabat():
	kickback = false
	
func mor():
	Global.mor()



func _on_hit_box_atac_body_entered(body):
	if body.has_method("mort"):
		$death_slime.play()
		body.mort()





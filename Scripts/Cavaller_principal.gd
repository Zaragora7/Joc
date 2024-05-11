extends CharacterBody2D

var vel_salt := Vector2.UP * 500
var direccio := Vector2(0, 0)
var velocitat_maxima = 200
var atacar:bool = false
var tinc_clau := false
var vides = 3
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_atac = $HitBoxAtac/CollisionShape2D
@onready var point_light_2d = $PointLight2D


func _physics_process(delta):

	direccio = Vector2(0,0)
	velocity.x = 0
	velocity.y = 0

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
	
	if velocity.length_squared() == 0 and not atacar:
	#if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite2D.play("Idle")
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("Running")
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("Running")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("Running")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("Running")
	#else:
	#	$AnimatedSprite2D.play("Idle")
func _atac():
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
	if area.has_method("mor"):
		area.mor()
	#if area.is_in_group("enemics"):
		#print(area.name)
		#area.queue_free()

func guanya_clau():
	print("Tinc una clau!")
	tinc_clau = true

func mal():
	#vides -= 1
	print("Au!")
	#if vides == 0:
		#self.mor()
	
	
func mor():
	get_tree().change_scene_to_packed(load("res://escenes/youdied.tscn"))

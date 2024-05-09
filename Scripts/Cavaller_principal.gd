extends CharacterBody2D


var vidas = 3
var kickback_strength := 200
var kickback = false
var vel_salt := Vector2.UP * 500
var direccio := Vector2(0, 0)
var velocitat_maxima = 200
var atacar:bool = false
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_atac = $HitBoxAtac/CollisionShape2D
@onready var point_light_2d = $PointLight2D


func _physics_process(delta):

	direccio = Vector2(0,0)
	velocity.x = 0
	velocity.y = 0


	if Input.is_action_pressed("Right"):
		direccio.x += 10
	if Input.is_action_pressed("Left"):
		direccio.x += -10
	if Input.is_action_pressed("Down"):
		direccio.y += 10
	if Input.is_action_pressed("Up"):
		direccio.y += -10
	if Input.is_action_just_pressed("atac"):
		_atac()
	velocity += direccio.normalized() * velocitat_maxima 
	move_and_slide()
	if (velocity.x > 10 or velocity.x < -10) or (velocity.y > 10 or velocity.y < -10):
		$AnimatedSprite2D.play("Running")
	else:
		#animated_sprite_2d.play("Idle")
		pass
			
	
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft
	for i in range(0, 1000):
		point_light_2d.energy -= 0.000001
		if point_light_2d.energy == 0 or point_light_2d.energy < 0:
			break
		
func _on_animated_sprite_2d_animation_finished():
	print("Has atacat")
	animated_sprite_2d.play("Idle")
	if animated_sprite_2d.animation == "atac2":
		collision_shape_atac.set_deferred("disabled", true)
		atacar = false
func _atac():
	animated_sprite_2d.play("atac2")
	collision_shape_atac.set_deferred("disabled", false)
	atacar = true


func _on_hit_box_atac_area_entered(area):
	area.mor()

func mal(pos_enemic: Vector2):
	var direccio = -global_position.direction_to(pos_enemic)
	kickback = true
	var tween = create_tween()
	tween.tween_property(self, "global_position", global_position + direccio*kickback_strength, 0.5).set_trans(Tween.TRANS_EXPO)
	tween.finished.connect(kickback_acabat)
		
func kickback_acabat():
	kickback = false

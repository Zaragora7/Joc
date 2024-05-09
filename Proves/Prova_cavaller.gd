extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var knokback = Vector2()
var fuerza = 150
var vidas = 3
var kickback_strength := 200
var kickback = false

func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if not kickback:
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		var directiony := Input.get_axis("Down","up")
		if directiony:
			velocity.y = directiony * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	

	move_and_slide()

func player_knockback():
	var knockback_direction = -velocity
	velocity = knockback_direction
	
	


func mal(pos_enemic: Vector2):
	print("Ouch!")
	vidas -= 1
	if vidas <= 0:
		get_tree().change_scene_to_file("res://mort.tscn")
	else:
		var direccio = -global_position.direction_to(pos_enemic)
		kickback = true
		var tween = create_tween()
		tween.tween_property(self, "global_position", global_position + direccio*kickback_strength, 0.5).set_trans(Tween.TRANS_EXPO)
		tween.finished.connect(kickback_acabat)
	
func kickback_acabat():
	kickback = false
func _on_garrote_body_entered(body):
	pass

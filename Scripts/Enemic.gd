extends CharacterBody2D

var vidas = 3
const SPEED = 100
var playerr = false
var plbody = null
var vector_knockback = Vector2()
var força = 100
var direccio_enemic = Vector2()



func _physics_process(delta):
	if playerr:
		#position += (plbody.position - position)/SPEED
		position += (plbody.position - position)


func _on_deteccio_body_entered(body):
		plbody = body
		playerr = true


func _on_deteccio_body_exited(body):
	plbody = null
	playerr = false


func _on_knockback_body_entered(body):
		if playerr:
			body.mal(global_position)

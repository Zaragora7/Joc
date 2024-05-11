extends CharacterBody2D
var velocitat := 20
var pl = null
var detecta := false
var vidas = 3
const SPEED = 100
var playerr = false
var plbody = null
var vector_knockback = Vector2()
var força = 100
var direccio_enemic = Vector2()


func _physics_process(delta):
	if detecta:
		position += (pl.position -position) / SPEED






func _on_deteccio_body_entered(body):
	detecta = true
	pl = body


func _on_deteccio_body_exited(body):
	detecta = false
	pl = null


func _on_knockback_body_entered(body):
	pass # Replace with function body.

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
var mortenemic = false


func _physics_process(delta):
	if detecta:
		position += (pl.position -position) / SPEED
	if mortenemic:
		queue_free()
		
		






func _on_deteccio_body_entered(body):
	if body.is_in_group("player"):
		detecta = true
		pl = body


func _on_deteccio_body_exited(body):
	detecta = false
	pl = null

func mor():
	print("muerto")
	queue_free()

func _on_knockback_body_entered(body):
	pass # Replace with function body.

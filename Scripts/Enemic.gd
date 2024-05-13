extends CharacterBody2D
var velocitat := 20
var pl = null
var detecta := false
var vidas = 3
var SPEED = 60



func _physics_process(delta):
	if detecta:
		$AnimatedSprite2D.play("run")
		position += (pl.position -position) / SPEED
	else:
		$AnimatedSprite2D.play("idle")


func _on_deteccio_body_entered(body):
	if body.is_in_group("player"):
		detecta = true
		pl = body


func _on_deteccio_body_exited(body):
	#detecta = false
	#pl = null
	pass

func mort():
	print("muerto")
	queue_free()

func _on_hitboxenemic_body_entered(body):
	if body.has_method("mor"):
		body.mal()
		queue_free()
		print("he tret una vida")

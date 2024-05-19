extends CharacterBody2D
var velocitat := 20
var pl = null
var detecta := false
var vidas = 3
var SPEED = 50

func _ready():
	pass


func _physics_process(delta):
	if detecta:
		$AnimatedSprite2D.play("run")
		position += (pl.position -position) / SPEED
	else:
		$AnimatedSprite2D.play("idle")


func _on_deteccio_body_entered(body):
	if body.is_in_group("player"):
		$hog_rider.play()
		detecta = true
		pl = body


func _on_deteccio_body_exited(body):
	#detecta = false
	#pl = null
	pass

func mort():
	$Timer.start()
	set_physics_process(false)
	$Hitboxenemic.queue_free()
	$CollisionShape2D.queue_free()
	print("muerto")
	$AnimatedSprite2D.play("death")
	
	
	


func _on_hitboxenemic_body_entered(body):
	if body.has_method("mor"):
		body.mal(global_position)
		print("he tret una vida")






func _on_timer_timeout():
	queue_free()

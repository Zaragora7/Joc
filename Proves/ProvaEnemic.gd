extends CharacterBody2D
var velocitat := 20
var pl = null
var detecta := false
var vidas = 3
const SPEED = 100
var vector_knockback = Vector2()
var força = 100
var direccio_en

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if detecta:
		position += (pl.position -position) / SPEED



func mort():
	queue_free()
	


func _on_detection_area_body_entered(body):
	pl = body
	detecta = true


func _on_detection_area_body_exited(body):
	pl = null
	detecta = false


func _on_hitbox_enemic_body_entered(body):
	if body.has_method("_on_hit_box_atac_area_entered"):
		queue_free()

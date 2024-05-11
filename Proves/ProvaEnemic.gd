extends Area2D
var velocitat := 20
var pl = null
var detecta := false
var vidas = 3
const SPEED = 100
var playerr = false
var plbody = null
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


func _on_area_2d_body_entered(body):
	pl = body
	detecta = true

func mor():
	queue_free()
	

extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detector_personatge_body_entered(body):
	if body.tinc_clau:
		$AnimatedSprite2D.play("default")
		$CollisionShape2D.set_deferred("disabled", true)
		body.tinc_clau = false
		

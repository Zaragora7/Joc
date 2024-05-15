extends Area2D
var speed = 20
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	randf_range(-10,10)
	direction = Vector2(randf_range(-20,20),randf_range(-20,20))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position + speed * delta * direction

	


func _on_timer_timeout():
	queue_free()



func mor():
	queue_free()


func _on_body_entered(body:PhysicsBody2D):
	if body.has_method("mal"):
		body.mal(global_position)
	mor()

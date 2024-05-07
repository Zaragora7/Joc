extends Area2D
var speed = 100
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


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
func mor():
	pass

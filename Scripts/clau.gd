extends Area2D


func _on_body_entered(body):
	body.guanya_clau()
	queue_free()

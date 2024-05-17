extends Area2D

signal clau_obtinguda

func _on_body_entered(body):
	emit_signal("clau_obtinguda")
	body.guanya_clau()
	$sound.play()
	queue_free()
	

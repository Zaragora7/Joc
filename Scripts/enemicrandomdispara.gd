extends Area2D

var nova_magia
var playable = false

func _on_timer_timeout():
	dispara()
	
	
	

func dispara():
	var magia: PackedScene = load("res://escenes/magia.tscn")
	nova_magia = magia.instantiate()
	$AnimatedSprite2D.play("default")
	add_child(nova_magia)
	nova_magia.global_position = self.global_position
	nova_magia.rotation = global_rotation
	if playable:
		$petardo.play()
	
func mor():
	queue_free()
	
	


func _on_area_2d_body_entered(body):
	playable = true




func _on_area_2d_body_exited(body):
	playable = false

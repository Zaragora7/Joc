extends Area2D

var nova_magia

func _on_timer_timeout():
	dispara()

func dispara():
	var magia: PackedScene = load("res://escenes/magia.tscn")
	nova_magia = magia.instantiate()
	
	add_child(nova_magia)
	nova_magia.global_position = self.global_position
	nova_magia.rotation = global_rotation
	

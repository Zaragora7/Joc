extends Node2D

func _ready():
	$AudioStreamPlayer.play()



func _on_button_pressed():
	ProvaMenu.musica_menu()
	get_tree().change_scene_to_file("res://escenes/menuinici.tscn")
	


func _on_button_2_pressed():
	get_tree().quit()
	pass # Replace with function body.

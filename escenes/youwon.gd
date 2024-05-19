extends Node2D

func _ready():
	$win.play()
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://escenes/tilemap_mazmorra.tscn")
	pass # Replace with function body.


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://escenes/menuinici.tscn")
	pass # Replace with function body.


func _on_button_2_pressed():
	get_tree().quit()
	pass # Replace with function body.

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$musica.play()
	ProvaMenu.musica_menu()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_història_pressed():
	pass # Replace with function body.


func _on_instruccions_pressed():
	get_tree().change_scene_to_packed(load("res://escenes/instruccions.tscn"))
	

func _on_nivells_pressed():
	$musica.stop()
	get_tree().change_scene_to_packed(load("res://escenes/tilemap_mazmorra.tscn"))

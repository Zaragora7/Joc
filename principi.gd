extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	ProvaMenu.musica_menu()
	get_tree().change_scene_to_packed(load("res://escenes/menuinici.tscn"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

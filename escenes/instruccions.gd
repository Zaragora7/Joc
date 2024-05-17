extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	ProvaMenu.musica_menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_back_pressed():
	get_tree().change_scene_to_packed(load("res://escenes/menuinici.tscn"))

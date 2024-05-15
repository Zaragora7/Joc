extends Node

var Contador:CanvasLayer
var vides = 3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func canvia_vides(pos_enemic):
	vides -= 1
	print("Au!")
	if vides == 0:
		self.mor()
		
func mor():
		get_tree().change_scene_to_packed(load("res://escenes/youdied.tscn"))
		vides = 3

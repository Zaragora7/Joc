extends CharacterBody2D
var velocitat := 20
var pl = null
var detecta := false


func _physics_process(delta):
#ifdetecta == true:
	#position
	pass



func _on_area_detect_body_entered(body):
	queue_free()

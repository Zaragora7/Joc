extends Area2D

signal clau_obtinguda
var cooldown = true
func _ready():
	pass
func _process(delta):
	if cooldown:
		animacio()
		cooldown = false
func animacio():
	$AnimationPlayer.play("pampallugueig")
	$Timer.start()
func _on_body_entered(body):
	emit_signal("clau_obtinguda")
	body.guanya_clau()
	$sound.play()
	queue_free()



func _on_timer_timeout():
	cooldown = true

extends CanvasLayer

var vides = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	$claus.text = str(vides)
	$Label2.text = str(":")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$claus.text = str(vides)


	


extends CanvasLayer

var clauss = 0
# Called when the node enters the scene tree for the first time.
func _ready():

	
	$claus.text = str(clauss)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clau_obtingudas():
	print("Clau obtinguda")
	clauss += 1
	$claus.text = str(clauss)

extends Button

func _ready():
	connect("pressed", self, "endGame")
	
func endGame():
	get_tree().quit()
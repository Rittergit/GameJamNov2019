extends Label

func _ready():
	text = str(Global.slice)
	
func _process(delta):
	text = str(Global.slice)

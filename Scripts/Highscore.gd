extends Label

func _ready():
	text = str(Global.highscore) + "‰"
	
func _process(delta):
	text = str(Global.highscore) + "‰"

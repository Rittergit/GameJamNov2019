extends Node2D

func _ready():
	get_child(0).text = str(Global.highscore)
	
func _process(delta):
	get_child(0).text = str(Global.highscore)

extends Area2D

func _ready():
	connect("body_entered", self, "collect")
	pass

func collect(object):
	if object.name == 'Player':
		Global.highscore += 0.1
		self.visible = false

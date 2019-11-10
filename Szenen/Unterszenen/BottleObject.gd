extends Area2D

func _ready():
	connect("body_entered", self, "collect")
	pass # Replace with function body.

func collect(object):
	if object.name == 'Player':
		print("Bottle collected!")
		self.visible = false

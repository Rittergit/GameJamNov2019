extends Area2D

func _ready():
	connect("body_entered", self, "collect")
	pass # Replace with function body.

func collect(object):
	if object.name == 'Player':
		Global.slice += 10
		self.visible = false

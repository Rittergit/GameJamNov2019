extends Node

var collisionObj
var collisionTimer

func _ready():
	collisionTimer = Timer.new()
	collisionTimer.connect("timeout", self, "dest")
	collisionTimer.set_wait_time(float(0.1))
	collisionTimer.start()
	add_child(collisionTimer)
	connect("body_entered", self, "collided")
	
func collided(object):
	if object.collision_layer == 2:
		object.queue_free()
	queue_free()
	
func dest():
	queue_free()
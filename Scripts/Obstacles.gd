extends Node

var object_to_spawn = preload("res://Szenen/Unterszenen/ObstacleObject.tscn")
var object1_to_spawn = preload("res://Szenen/Unterszenen/Obstacle2.tscn")
var object2_to_spawn = preload("res://Szenen/Unterszenen/Obstacle3.tscn")
var displayHeight = ProjectSettings.get("display/window/size/height")

var spawn_timer
var move_timer
var spawnSpeed = 1
var moveSpeed = 3
var spawns = []
var objects = []
var missingBlocks = 3
var randomGenerator = RandomNumberGenerator.new()

func _ready():
	randomGenerator.randomize()
	spawn_timer = Timer.new()
	move_timer = Timer.new()
	spawn_timer.connect("timeout", self, "spawnObjects")
	move_timer.connect("timeout", self, "moveObjects")
	spawns = get_children()
	spawn_timer.set_wait_time(float(1) / float(spawnSpeed))
	move_timer.set_wait_time(float(1) / (float(16) * float(moveSpeed)))
	spawn_timer.start()
	move_timer.start()
	add_child(spawn_timer)
	add_child(move_timer)

func _process(delta):
	pass

func spawnObjects():
	var startMissingNum = randomGenerator.randi_range(0, spawns.size() - 1)
	var missingCount = randomGenerator.randi_range(0, missingBlocks)
	var missingBlocks = []
	for idx in range(missingCount - 1):
		idx += 1
		if startMissingNum + idx == spawns.size() - 1:
			missingBlocks.append(startMissingNum - idx)
		else:
			missingBlocks.append(startMissingNum + idx)
	for spawnIdx in range(spawns.size()):
		if spawnIdx in missingBlocks:
			continue
		var obj
		if spawnIdx == 0:
			obj = object1_to_spawn.instance()
		elif spawnIdx == 7:
			obj =  object2_to_spawn.instance()
		else:
			obj = object_to_spawn.instance()
		obj.position = spawns[spawnIdx].position
		objects.append(weakref(obj))
		add_child(obj)
		
func moveObjects():
	var objectsToRemove = []
	for objIndex in range(objects.size()):
		var obj = objects[objIndex]
		if obj.get_ref() == null:
			continue
		var objRef = obj.get_ref()
		objRef.position.y += 1
		if objRef.position.y > displayHeight:
			objRef.queue_free()
			objectsToRemove.append(objIndex)
	objectsToRemove.invert()
	for objIndex in objectsToRemove:
		objects.remove(objIndex)
		
		

extends Node

var object_to_spawn = preload("res://Szenen/Unterszenen/ObstacleObject.tscn")

var spawn_timer
var move_timer
var spawnSpeed = 1
var moveSpeed = 2
var spawns = []
var objects = []
var missingBlocks = 3
var randomGenerator = RandomNumberGenerator.new()

func _ready():
	randomize()
	spawn_timer = Timer.new()
	move_timer = Timer.new()
	spawn_timer.connect("timeout", self, "spawnObjects")
	move_timer.connect("timeout", self, "moveObjects")
	spawns = get_children()
	spawn_timer.set_wait_time(float(1) / float(spawnSpeed))
	move_timer.set_wait_time(float(1) / float(moveSpeed))
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
		var obj = object_to_spawn.instance()
		obj.position = spawns[spawnIdx].position
		objects.append(obj)
		add_child(obj)
		
func moveObjects():
	for obj in objects:
		obj.position.y += 16

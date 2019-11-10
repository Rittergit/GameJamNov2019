extends Node

var rng = RandomNumberGenerator.new()
var moveTimer
var spawnTimer
var bottlePacked = preload("res://Szenen/Unterszenen/BottleObject.tscn")

var bottles = []
var numberOfColumns = 8
var speed = 3
var minDist = 1
var maxDist = 10

# Distance in rows between two bottles
var displayHeight = ProjectSettings.get("display/window/size/height")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

	moveTimer = Timer.new()
	moveTimer.connect("timeout", self, "moveBottles")
	moveTimer.set_wait_time(float(1) / (float(16) * float(speed)))
	moveTimer.start()
	add_child(moveTimer)
	
	spawnTimer = Timer.new()
	spawnTimer.connect("timeout", self, "createBottle")
	spawnTimer.set_wait_time(rng.randi_range(minDist, maxDist))
	spawnTimer.start()
	add_child(spawnTimer)
	
func _process(delta):
	pass
	
# Create bottle and add to array	
func createBottle():
	var bottle = bottlePacked.instance()
	var pos = Vector2(getRandomXPos(), 0)
	bottle.position = pos
	bottles.append(bottle)
	add_child(bottle)
	spawnTimer.set_wait_time(rng.randi_range(minDist, maxDist))
	
func moveBottles():
	var objectsToRemove = []
	for bottleIndex in range(bottles.size()):
		var bottle = bottles[bottleIndex]
		bottle.position.y += 1
		if bottle.position.y > displayHeight:
			objectsToRemove.append(bottleIndex)
			bottle.queue_free()
	objectsToRemove.invert()
	for bottleIndex in objectsToRemove:
		bottles.remove(bottleIndex)
	
func getRandomXPos():
	var randomPos = rng.randi_range(0, numberOfColumns - 1)
	return randomPos*16

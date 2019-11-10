extends Node

var rng = RandomNumberGenerator.new()
var moveTimer
var spawnTimer
var sawbladePacked = preload("res://Szenen/Unterszenen/SawbladeObject.tscn")

var sawblades = []
var numberOfColumns = 8
var speed = 3
var minDist = 1
var maxDist = 10

# Distance in rows between two sawblades
var displayHeight = ProjectSettings.get("display/window/size/height")


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

	moveTimer = Timer.new()
	moveTimer.connect("timeout", self, "moveSawblades")
	moveTimer.set_wait_time(float(1) / (float(16) * float(speed)))
	moveTimer.start()
	add_child(moveTimer)
	
	spawnTimer = Timer.new()
	spawnTimer.connect("timeout", self, "createSawblade")
	spawnTimer.set_wait_time(rng.randi_range(minDist, maxDist))
	spawnTimer.start()
	add_child(spawnTimer)
	
func _process(delta):
	pass
	
# Create sawblade and add to array	
func createSawblade():
	var sawblade = sawbladePacked.instance()
	var pos = Vector2(getRandomXPos(), 0)
	sawblade.position = pos
	sawblades.append(sawblade)
	add_child(sawblade)
	spawnTimer.set_wait_time(rng.randi_range(minDist, maxDist))
	
func moveSawblades():
	var objectsToRemove = []
	for sawbladeIndex in range(sawblades.size()):
		var sawblade = sawblades[sawbladeIndex]
		sawblade.position.y += 1
		if sawblade.position.y > displayHeight:
			objectsToRemove.append(sawbladeIndex)
			sawblade.queue_free()
	objectsToRemove.invert()
	for sawbladeIndex in objectsToRemove:
		sawblades.remove(sawbladeIndex)
	
func getRandomXPos():
	var randomPos = rng.randi_range(0, numberOfColumns - 1)
	return randomPos*16










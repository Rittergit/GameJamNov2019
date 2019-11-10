extends Node

var rng = RandomNumberGenerator.new()
var moveTimer
var spawnTimer
var bottlePacked = preload("res://Szenen/Unterszenen/BottleObject.tscn")

var bottles = []
var numberOfColumns = 8
var speed = 0.1
var minDist = 1
var maxDist = 10

# Distance in rows between two bottles
var randomDistance
var currentRow


# Called when the node enters the scene tree for the first time.
func _ready():
	currentRow = 0
	randomDistance = rng.randi_range(minDist, maxDist)
	moveTimer = Timer.new()
	moveTimer.connect("timeout", self, "moveBottles")
	moveTimer.set_wait_time(float(1) / float(16) * float(2))
	moveTimer.start()
	add_child(moveTimer)
	
	spawnTimer = Timer.new()
	spawnTimer.connect("timeout", self, "createBottle")
	spawnTimer.set_wait_time(rng.randi_range(1, 10))
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
	print("bottles: ", bottles.size())
	spawnTimer.set_wait_time(rng.randi_range(1, 10))
	
func moveBottles():
	for bottle in bottles:
		# var currentPos = bottle.get_pos()
		bottle.position.y += 1
	
func getRandomXPos():
	var randomPos = rng.randi_range(0, numberOfColumns - 1)
	return randomPos*16
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

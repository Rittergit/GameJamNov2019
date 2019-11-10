extends Node

var Spawn = preload("Spawn.tscn")

var obstacles_node_children = []
var global_timer = 0
var moving_obstacles_arr = []

# Called when the node enters the scene tree for the first time.
func _ready():
	obstacles_node_children = get_children()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_timer = (global_timer+1)%60 
	if global_timer == 0:
		var moving_obstacles = get_moving_obstacles(obstacles_node_children)
		moving_obstacles_arr.append(moving_obstacles)
		for obstacles in moving_obstacles_arr:
			for obstacle in obstacles:
				if obstacle == $_NULL:
					continue
				obstacle.position.y += 10
				print(obstacle, obstacle.position.y)
	
func get_moving_obstacles(obstacles):
	var deltion_num = randi()%10
	var deltion_nums = [deltion_num, deltion_num + 1]
	var to_sent_obstacles = []	
	
	if obstacles.size() <= 0:
		return
	for idx in range(obstacles.size()):
		if not deltion_nums.has(idx):
			var obst = Spawn.instance()
			obst.position = obstacles[idx].position
			to_sent_obstacles.append(Spawn.instance())
		else:
			to_sent_obstacles.append($_NULL)
	return to_sent_obstacles


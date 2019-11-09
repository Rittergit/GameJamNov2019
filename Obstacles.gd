extends Node

var obstacles_node_children = []
var global_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	obstacles_node_children = get_children()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_timer = (global_timer+1)%60 
	if global_timer == 0:
		var moving_obstacles = get_moving_obstacles(obstacles_node_children)
		for obstacle in moving_obstacles:
			print(obstacle.position.y)
			obstacle.position.y += 10
	
func get_moving_obstacles(obstacles):
	var deltion_num = randi()%10
	var deltion_nums = [deltion_num, deltion_num + 1]
	var to_sent_obstacles = []
	
	if obstacles.size() <= 0:
		return
	for idx in range(obstacles.size()):
		if not deltion_nums.has(idx):
			to_sent_obstacles.append(obstacles[idx])
		else:
			to_sent_obstacles.append($_NULL)
	return obstacles


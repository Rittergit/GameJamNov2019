extends Line2D

# Declare member variables here. Examples:
var point
var target
export (NodePath) var targetPath
export var trailLength = 0
var mouseObjectPacked = preload("res://Szenen/Unterszenen/MouseObject.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node(targetPath)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target.position = get_global_mouse_position()
	global_position = Vector2(0,0)
	point = target.global_position
	if get_point_count() >= trailLength:
		remove_point(0)
	if Input.is_action_pressed('leftbutton'):
		var obj = mouseObjectPacked.instance()
		obj.position = point
		add_child(obj)
		add_point(point)
	if Input.is_action_just_released('leftbutton'):
		clear_points()

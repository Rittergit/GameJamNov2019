extends Node2D

var pointSprite = load("res://pointSprite.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('leftbutton'):
		var mousePosition =  get_global_mouse_position()
		print(mousePosition.x)
		var node = pointSprite.instance()
		node.position = mousePosition		
		add_child(node)
		
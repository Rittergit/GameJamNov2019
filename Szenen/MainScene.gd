extends Node2D

export (NodePath) var TrailPath
var trail


# Called when the node enters the scene tree for the first time.
func _ready():
    trail = get_node(TrailPath)

func _process(delta):
    trail.position =  get_global_mouse_position()
        
        
        

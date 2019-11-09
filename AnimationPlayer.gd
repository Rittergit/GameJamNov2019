extends AnimationPlayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
    if Input.is_action_pressed('right'):
        play("walk")
    if Input.is_action_pressed('left'):
        play("walk")

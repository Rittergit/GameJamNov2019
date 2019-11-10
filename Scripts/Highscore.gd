extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = "0"
var Added = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var text_label = get_child(0)
	text_label.push_align(RichTextLabel.ALIGN_RIGHT)
	text_label.add_text(str(int(score) + Added))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

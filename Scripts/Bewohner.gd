extends Node2D

# Declare member variables here. Examples:
var start = false
var rand = 0
var move_timer

# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    move_timer = Timer.new()
    move_timer.connect("timeout", self, "moveDude")
    move_timer.set_wait_time(float(1) / 30)
    move_timer.start()
    add_child(move_timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
   pass
func moveDude():
    randomize()
    if start == false:
        rand = randi()%128
        start = true
    if start == true:
        if position.x < rand:
            position.x +=1
        if position.x > rand:
            position.x -= 1
        if position.x == rand:
            start = false
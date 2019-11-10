extends KinematicBody2D

export (int) var speed = 100
var rightBorder = 48
var leftBorder = -32

var velocity = Vector2()

func get_input():
    velocity = Vector2()
    if Input.is_action_just_pressed('right'):
        if position.x <= rightBorder:
            position.x += 16
    if Input.is_action_just_pressed('left'):
        if position.x >= leftBorder:
            position.x -= 16
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    #velocity = move_and_slide(velocity)

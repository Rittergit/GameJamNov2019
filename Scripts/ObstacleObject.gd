extends Node

func _ready():
	connect("body_entered", self, "collided")

func collided(object):
	if object.name == "Player":
		Global.highscore = Global.originalHighscore
		Global.slice = Global.originalSlice
		get_tree().change_scene("res://Szenen/Unterszenen/Menu.tscn")

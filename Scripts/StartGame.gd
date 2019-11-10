extends Button

func _ready():
	connect("pressed", self, "startGame")

func startGame():
	get_tree().change_scene("res://Szenen/MainScene.tscn")

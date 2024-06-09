extends Control

var ScreenViewer : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	ScreenViewer = $Screen


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _lost_connection():
	print("Connection lost")

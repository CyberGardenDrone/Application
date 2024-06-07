extends Control

var ScreenViewer : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	ScreenViewer = $Screen


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _update_screen(Sprite):
	if Sprite != null:
		ScreenViewer = Sprite
		print("Что-то пришло")
	else:
		printerr("Что-то пошло не так")

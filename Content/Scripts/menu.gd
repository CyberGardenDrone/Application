extends Control

var ScreenViewer : Sprite2D

var MoveConsoleTween : Tween
var IsKonsoleUp = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ScreenViewer = $Screen
	MoveConsoleTween = create_tween()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _lost_connection():
	print("Connection lost")


func _on_console_button_pressed():
	MoveConsoleTween = get_tree().create_tween()
	MoveConsoleTween.set_ease(Tween.EASE_OUT)
	MoveConsoleTween.tween_property($ConsolePanel,"position:y",-157, 0.5)
	IsKonsoleUp = true
		


func _on_console_button_down_pressed():
	MoveConsoleTween = get_tree().create_tween()
	MoveConsoleTween.set_ease(Tween.EASE_IN)
	MoveConsoleTween.tween_property($ConsolePanel,"position:y",925, 0.5)
	IsKonsoleUp = false

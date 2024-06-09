extends Control

var ScreenViewer : Sprite2D

var MoveConsoleTween : Tween
var IsKonsoleUp = false
var Text : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	ScreenViewer = $Screen
	MoveConsoleTween = create_tween()
	Text = $Konsole


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


func _update_string(string):
	var str : String = string
	
	if(str[6] == ':') and (str[30] == '{'):
		str = str.replace("<", " ")
		str = str.replace(">", " ")
		$ConsolePanel/SidePanel/Konsole.add_text("TYPE: " + str.substr(0, 6) + " MAC: " + str.substr(8, 29) + "  SSID: " + str.substr(31, 63) + " DCST: " + str.substr(64, 86))
		$ConsolePanel/SidePanel/Konsole.add_text(" CHAIN: " + str.substr(87, 91) + " RSSI: " + str.substr(92, 95) + "\n")
		#print(str.substr(0, 6))

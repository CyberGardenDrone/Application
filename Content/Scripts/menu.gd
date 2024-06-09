extends Control

var ScreenViewer : Sprite2D

var MoveConsoleTween : Tween
var IsKonsoleUp = false
var Text : RichTextLabel
var Back : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	ScreenViewer = $Screen
	MoveConsoleTween = create_tween()
	
	Back = $Background
	Text = $Konsole

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _lost_connection():
	print("Connection lost")


func _update_string(string):
	
	var str : String = string
	
	if(str[6] == ':') and (str[30] == '{'):
		
		str = str.replace("<", " ")
		str = str.replace(">", " ")
		
		str = str.replace("{", " ")
		str = str.replace("}", " ")
		
		var TYPE = "TYPE: " + str.substr(0, 6)
		var MAC = "MAC: " + str.substr(7, 30)
		var SSID = "SSID: " + str.substr(31, 32)
		var DCST = "DEST: " + str.substr(64, 24)
		var CHAIN = "CHAN: " + str.substr(87, 3)
		var RSSI ="RSSI: " + str.substr(92, 3)
		
		Text.append_text("[color=white]" + TYPE + " " + MAC + " " + SSID + " " + DCST + " " + CHAIN + " " + RSSI + "[/color]\n")

	
	

extends Node

signal UpdateScreen(Sprite : Sprite2D)

@export_category("Server settings")
@export var port : int = 11130
@export var host = "http://10.42.0.1:11130"
var http_request : HTTPRequest
var Menu : Control
var OutSprite : Sprite2D
var error = 0
var headers = []

# Called when the node enters the scene tree for the first time.
func _ready():
	http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	var error = http_request.request(host+"/api/get")
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	print(error)
	
	Menu = get_node("Menu")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.`
func _process(delta):
	pass
	

func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	
	for str in response:
		print(str)
		var st : String = str
		#print(st.substr(0, 5))
	

extends Node

signal LostConnection
signal OutString(string : String)

#Настройки клиента из инспектора
@export_category("Client settings")
@export var port = "11130"
@export var host = "http://10.42.0.1"

#Объект клиента
var http_request : HTTPRequest
var error = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	var error = http_request.request(host + ":" + port + "/api/get")
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	else:
		LostConnection.emit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.`
func _process(delta):
	pass
	

func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	
	if response != null:
		for str in response:
			var st : String = str
			st = st.replace("-", " ")
			st = st.replace("<", " ")
			st = st.replace(">", " ")
		
			OutString.emit(st)
	else:
		return null
	

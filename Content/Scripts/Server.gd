extends Node

signal UpdateScreen(Sprite : Sprite2D)

@export_category("Server settings")
@export var port : int = 5858

var Server : UDPServer
var Menu : Control
var OutSprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#инициализация сервера
	Server = UDPServer.new()
	Server.listen(port)
	
	#кастуем на менюшку
	Menu = get_node("Menu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#получаем пакеты с сервера
	Server.poll()
	
	#Проверяем и получаем изображения
	if Server.is_connection_available():
		var peer = Server.take_connection()
		var packet = peer.get_packet()
		var image = Image.new()
		image.load_jpg_from_buffer(packet)
		OutSprite.texture = image
		UpdateScreen.emit(OutSprite)
	else:
		UpdateScreen.emit(null)
	

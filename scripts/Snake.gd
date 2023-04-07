extends Node2D

var player = false
var tamanho = 50
var velocidade
var direcao = Vector2(0,0)
var vivo = true

func _ready():
	position = Vector2(Global.width/2,Global.height/2)
	
func _process(delta):
	velocidade=Global.level+2
	position += transform.x * velocidade
	if position.x < 0 or position.y < 0 or position.x > Global.width or position.y > Global.height:
		vivo = false
	get_node("Body").add_point(position)
	while get_node("Body").get_point_count() > tamanho:
		get_node("Body").remove_point(0)

func _input(event):
	if player:
		if event.is_action_pressed("ui_down"):
			if rotation_degrees != 270:
				rotation_degrees = 90
		elif event.is_action_pressed("ui_left"):
			if rotation_degrees != 0:
				rotation_degrees = 180
		elif event.is_action_pressed("ui_right"):
			if rotation_degrees != 180:
				rotation_degrees = 0
		elif event.is_action_pressed("ui_up"):
			if rotation_degrees != 90:
				rotation_degrees = 270

func _vivo():
	return vivo
	
func _add_body():
	tamanho += 10
	get_node("Body").trail_length = tamanho

extends Node2D

var tamanho = 1
var posicao = Vector2(Global.width/2,Global.height/2)
var velocidade = Global.level + 2
var direcao = Vector2(0,0)

func _process(delta):
	position = posicao
	posicao = posicao + (direcao * velocidade)
	if posicao.x < 0 or posicao.y < 0 or posicao.x > Global.width or posicao.y > Global.height:
		#print ("saiu da tela")
		pass

func _input(event):
	if event.is_action_pressed("ui_down"):
		direcao = Vector2(0,1)
	elif event.is_action_pressed("ui_left"):
		direcao = Vector2(-1,0)
	elif event.is_action_pressed("ui_right"):
		direcao = Vector2(1,0)
	elif event.is_action_pressed("ui_up"):
		direcao = Vector2(0,-1)

extends Node2D

var player = false
var tamanho = 50
var velocidade
var direcao = Vector2(0,0)
var vivo = true
var anim

func _ready():	
	position = Vector2(Global.width/2,Global.height/2)
	anim = get_node("AnimationPlayer")
		
func _physics_process(delta):
	velocidade=(Global.points*2)+100
	move_local_x(delta * velocidade)
	if position.x < 0 or position.y < 0 or position.x > Global.width or position.y > Global.height:
		vivo = false
	get_parent().get_node("Body").add_point(position)
	while get_parent().get_node("Body").get_point_count() > tamanho:
		get_parent().get_node("Body").remove_point(0)

func _input(event):
	if player:
		var rot = round(rotation_degrees)
		if event.is_action_pressed("ui_down"):
			if rot != 270:
				if rot ==0 or rot==360:
					anim.play("right_down")
				elif rot ==180:
					anim.play("left_down")
		elif event.is_action_pressed("ui_left"):
			if rot != 0:
				if rot ==270:
					anim.play("up_left")
				elif rot ==90:
					anim.play("down_left")
		elif event.is_action_pressed("ui_right"):
			if rot != 180:
				if rot ==270:
					anim.play("up_right")
				elif rot ==90:
					anim.play("down_right")
		elif event.is_action_pressed("ui_up"):
			if rot != 90:
				if rot ==0 or rot==360:
					anim.play("right_up")
				elif rot ==180:
					anim.play("left_up")

func _vivo():
	return vivo
	
func _add_body():
	tamanho += 10
	get_parent().get_node("Body").trail_length = tamanho

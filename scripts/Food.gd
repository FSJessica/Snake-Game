extends Node2D

var colidiu = false

func _on_Area2D_body_entered(body):
	if body.name == "Snake":
		print ("colidiu com cobrinha")
		colidiu = true
		
func _colidiu():
	return colidiu



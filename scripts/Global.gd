extends Node2D

var snakePath = preload("res://scenes/Snake.tscn")
var foodPath = preload ("res://scenes/Food.tscn")
var level
var points
var width  
var height

func _ready():
	width = get_viewport().get_visible_rect().size.x
	height = get_viewport().get_visible_rect().size.y
	_restart_game()

func _restart_game():
	level = 0.0
	points = 0 

func _add_point():
	points +=1
	level=(points/15.0)

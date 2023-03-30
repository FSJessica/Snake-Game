extends Node2D

var snakePath = preload("res://scenes/Snake.tscn")
var foodPath = preload ("res://scenes/Food.tscn")
var level = 0
var points = 0
var width  
var height

func _ready():
	width = get_viewport().get_visible_rect().size.x
	height = get_viewport().get_visible_rect().size.y


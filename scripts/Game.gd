extends Node2D

var snake
var food

func _ready():
	randomize()
	snake = Global.snakePath.instantiate()
	add_child(snake)
	_food_create()
	print(get_viewport().get_visible_rect().size)

func _food_create():
	food = Global.foodPath.instantiate()
	add_child(food)
	food.position = Vector2(randf_range(0, Global.width),randf_range(0,Global.height))

func _process(delta):
	if food != null:
		if food._colidiu():
			food.queue_free()
			_food_create()


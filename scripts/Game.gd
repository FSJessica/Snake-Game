extends Node2D

var snake
var food

func _ready():
	randomize()
	snake = Global.snakePath.instantiate()
	snake.player = true
	add_child(snake)
	_food_create()
	print(get_viewport().get_visible_rect().size)

func _food_create():
	food = Global.foodPath.instantiate()
	add_child(food)
	food.position = Vector2(randf_range(0, Global.width),randf_range(0,Global.height))

func _process(delta):
	get_node("Points").text=str(Global.points)
	get_node("Level").text=str(Global.level)
	if !snake._vivo():
		Global._restart_game()
		get_tree().reload_current_scene()
	if food != null:
		if food._colidiu():
			food.queue_free()
			_food_create()
			snake._add_body()
			Global._add_point()



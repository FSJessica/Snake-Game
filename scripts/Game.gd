extends Node2D

var snake
var food
var body

func _ready():
	randomize()
	snake = Global.snakePath.instantiate()
	snake.player = true
	body=Global.bodyPath.instantiate()
	body.target=snake
	add_child(snake)
	add_child(body)
	_food_create()

func _food_create():
	food = Global.foodPath.instantiate()
	add_child(food)
	food.position = Vector2(randf_range(30, Global.width -30),randf_range(30,Global.height -30))

func _process(delta):
	get_node("Points").text=str(Global.points)
	if !snake._vivo():
		Global._restart_game()
		get_tree().reload_current_scene()
	if food != null:
		if food._colidiu():
			food.queue_free()
			_food_create()
			snake._add_body()
			Global._add_point()


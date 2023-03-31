extends Line2D

var target
var point
@export_node_path("Node2D") var target_path
var trail_length = 50

func _ready():
	target = get_node(target_path)

func _process(delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	point = target.global_position
	add_point(point)
	while get_point_count() > trail_length:
		remove_point(0)
		

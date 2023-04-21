extends Line2D

var target
var point
var trail_length = 50
var trail_offset =18

func _physics_process(delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	point = target.global_position
	add_point(point)
	while get_point_count() > trail_length:
		remove_point(0)
	_clean_area()
	_collision_setup()

func _collision_setup():
	var i=0
	while i < points.size()-trail_offset:
		var new_shape = CollisionShape2D.new()
		$Area2D.add_child(new_shape)
		var segment = SegmentShape2D.new()
		segment.a = points[i]
		for j in range(i,points.size()-trail_offset):
			if !(points[j].x == points[i].x or points[j].y == points[i].y):
				segment.b = points[j]
				i = j
				break
			if j == (points.size() -trail_offset-1):
				segment.b = points[j]
				i = j
				break
		new_shape.shape = segment
		i+=1

func _clean_area():
	for i in $Area2D.get_children():
		$Area2D.remove_child(i)
		i.queue_free()

func _on_area_2d_area_entered(area):
	if area.name=="snakeArea":
		area.get_parent().vivo=false

tool
class_name MinSizeXIsHigh extends Control

var last_hight: int = 0

func _process(delta):
	if rect_size.y != last_hight:
		rect_min_size.x = rect_size.y
		last_hight = rect_size.y
	pass

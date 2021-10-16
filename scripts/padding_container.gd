tool
class_name PaddingContainer extends Container

export var padding_left : int setget set_padding_left
export var padding_top : int setget set_padding_top
export var padding_right : int setget set_padding_right
export var padding_bottom : int setget set_padding_bottom

func set_padding_left(value: int):
	padding_left = value
	queue_sort()

func set_padding_top(value: int):
	padding_top = value
	queue_sort()

func set_padding_right(value: int):
	padding_right = value
	queue_sort()

func set_padding_bottom(value: int):
	padding_bottom = value
	queue_sort()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _get_minimum_size():
	var ms : Vector2 = Vector2(0, 0)
	for child in get_children():
		var minsize = (child as Control).get_combined_minimum_size()
		ms.x = max(ms.x, minsize.x);
		ms.y = max(ms.y, minsize.y);
	return ms + Vector2(padding_right + padding_left, padding_top + padding_bottom)

func _notification(what: int):
	match what:
		NOTIFICATION_SORT_CHILDREN:
			for child in get_children():
				if(child):
					var x := padding_right
					var y := padding_top
					var width := rect_size.x - padding_right - padding_left
					var height := rect_size.y - padding_top - padding_bottom
					var rect := Rect2(x, y, width, height)
					#var rect := Rect2(0, 0, rect_size.x, rect_size.y)
					
					fit_child_in_rect(child, rect)

class_name SmoothScrollContainer extends ScrollContainer

export var scroll_speed : int = 2500

var is_scrolling : bool = false
var scroll_target : int = 0

func smooth_scroll_to(scroll: int):
	is_scrolling = true
	scroll_target = scroll

func _process(delta):
	if is_scrolling:
		scroll_horizontal = move_toward(scroll_horizontal, scroll_target, float(scroll_speed) * delta)
		
		# TODO: Implement scroll_horizontal >= properly
		if(scroll_horizontal == scroll_target || scroll_horizontal == 0):
			is_scrolling = false
		else:
			print("scroll: ", scroll_horizontal, " size: ", rect_size.x)
	pass

func move_toward(source: int, to: int, delta: float) -> int:
	var dist = to - source
	
	if(dist <= delta):
		return to
	else:
		return (source + dist) / (dist * delta)

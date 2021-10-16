extends TextureRect

export var speed : float = 90


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rect_pivot_offset = rect_size / 2
	rect_rotation += speed * delta

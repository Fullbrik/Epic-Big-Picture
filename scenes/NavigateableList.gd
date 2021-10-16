extends Control

signal item_pressed(item)

export var list_item : PackedScene

onready var scroll_container : SmoothScrollContainer = $ScrollContainer
onready var list_container = $ScrollContainer/ListContainer

var items : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func add_item(icon: Texture, title_text: String):
	var item = list_item.instance()
	item.icon_texture = icon
	item.title_text = title_text
	items.append(item)
	var index : int = items.size() - 1
	list_container.add_child(item)
	
	if items.size() == 1: # Focus first item
		item.grab_focus()
	
	item.connect("pressed", self, "on_item_pressed", [index])
	item.connect("button_focussed", self, "on_item_focussed", [index])

func on_item_pressed(index: int):
	emit_signal("item_pressed", index)

func on_item_focussed(index: int):
	var item := items[index] as Control
	
	# Get the right/left side of the scroll container (adjusted for scroll amount)
	var scroll_right : int = scroll_container.rect_size.x + scroll_container.rect_position.x + scroll_container.scroll_horizontal
	var scroll_left : int = scroll_container.rect_position.x + scroll_container.scroll_horizontal
	
	# Check if the item is too far right/left
	if(item.rect_position.x + item.rect_size.x > scroll_right || item.rect_position.x < scroll_left):
		scroll_container.smooth_scroll_to(item.rect_position.x + (item.rect_size.x/2) - (scroll_container.rect_size.x/2))

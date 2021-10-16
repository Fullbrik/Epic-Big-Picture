extends Control

signal pressed
signal button_focussed

export var icon_texture : Texture
export var title_text : String

onready var icon_rect = $AspectRatioContainer/PaddingContainer/Icon
onready var title_label = $AspectRatioContainer/Panel/Title
onready var button = $AspectRatioContainer/Button

func _ready():
	if(icon_texture):
		icon_rect.texture = icon_texture
	title_label.text = title_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func grab_focus():
	button.grab_focus()

func _on_Button_pressed():
	emit_signal("pressed")


func _on_Button_focus_entered():
	emit_signal("button_focussed")

extends Control

export var launcher : PackedScene

onready var sid_edit : LineEdit = $SID/SIDEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LoginButton_pressed():
	if(Legendary.login(sid_edit.text)):
		get_tree().change_scene_to(launcher)

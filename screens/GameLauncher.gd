extends Control

onready var game_launcher = $NavigateableList


# Called when the node enters the scene tree for the first time.
func _ready():
	Legendary.get_games()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

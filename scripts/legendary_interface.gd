extends Node

func login(sid: String) -> bool:
	var output := []
	OS.execute("legendary", ["auth", "--sid", sid], true, output)
	print(output)
	return true

func get_games():
	var output := []
	OS.execute("legendary", ["list-games", "--json"], true, output)
	print(output)
	
	return []

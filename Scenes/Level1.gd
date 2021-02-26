extends Node2D

var plane = preload("res://Scenes/Player.tscn")

func _ready():
	var player = plane.instance()
	add_child(player)
	player.position = $spawn.position

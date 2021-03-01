extends Node2D

signal drop
signal disable

var plane = preload("res://Scenes/Player.tscn")
var people = preload("res://Scenes/People.tscn")

func _ready():
	$Rescues/People.connect("picked", self, "_on_picked")


#drops off the picked up person
func _on_picked():
		yield(self,"drop")
		var rescued = people.instance()
		add_child(rescued)
		rescued.position = $Dropoff/droppoint.position
		emit_signal("disable")

#emits signal to drop player
func _on_droppoint_body_entered(body):
	if  body.global_position > $Dropoff/droppoint.global_position:
		emit_signal("drop")

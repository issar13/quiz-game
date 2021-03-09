extends Node2D

signal drop
signal enable

var people = load("res://Scenes/People.tscn")

func _ready():
	emit_signal("enable")

#emits drop signal
func _physics_process(_delta):
	if $Dropoff/drop2.is_colliding() or $Dropoff/drop.is_colliding() or $Dropoff/drop3.is_colliding():
		emit_signal("drop")

#drops off the picked up person
func _on_people_picked():
	yield(self,"drop")
	var rescued = people.instance()
	add_child(rescued)
	rescued.position = $Player/Player.position

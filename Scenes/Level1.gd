extends Node2D

signal drop
signal disable

var people = load("res://Scenes/People.tscn")


func _ready():
	$Rescues/People.connect("picked", self, "_on_picked")

#emits drop signal
func _physics_process(delta):
	if $Dropoff/drop.is_colliding():
		emit_signal("drop")

#drops off the picked up person
func _on_picked():
		yield(self,"drop")
		var rescued = people.instance()
		emit_signal("disable")
		add_child(rescued)
		rescued.position = $Dropoff/release.position


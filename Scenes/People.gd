extends KinematicBody2D
class_name Instance

signal picked


func _physics_process(_delta):
	if $Pickup.enabled and $Pickup.is_colliding():
		emit_signal("picked")
		queue_free()



func _on_Level_1_enable():
	$Pickup.enabled = true

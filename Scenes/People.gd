extends KinematicBody2D

signal picked


func _physics_process(delta):
	if $Pickup.is_colliding():
		emit_signal("picked")
		queue_free()



func _on_Level_1_disable():
	$Pickup.disable = true

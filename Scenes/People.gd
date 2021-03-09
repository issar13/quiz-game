extends KinematicBody2D

signal picked

var motion = Vector2(0,1)
const GRAVITY = 100



func _physics_process(_delta):
	move_and_slide(motion)
	motion.y = GRAVITY
	if $Pickup.is_colliding():
		emit_signal("picked")
		queue_free()

func _on_Level_1_enable():
	$Pickup.enabled = true

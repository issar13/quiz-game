extends KinematicBody2D

signal picked

#picks up the person on contact
func _on_pickup_body_shape_entered(body_id, body, body_shape, area_shape):
	if  body.global_position < $pickup.global_position:
		emit_signal("picked")
		queue_free()



func _on_Level_1_disable():
	$pickup/CollisionShape2D.disabled = true

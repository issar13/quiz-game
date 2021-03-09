extends KinematicBody2D


signal activate_gravity

const GRAVITY = 700
const SPEED = 1200
const FLY = -1200
const GLIDE = Vector2(0, -1)

var motion = Vector2()



func _physics_process(_delta):
	motion = move_and_slide(motion)
	
	
	if Input.is_action_pressed("left"):
		motion.x = -SPEED
		$PlayerSprite.flip_h = true
	elif Input.is_action_pressed("right"):
		motion.x = SPEED
		$PlayerSprite.flip_h = false
	else:
		motion.x = 0
	
	if is_on_ceiling() or motion.y !=0 or is_on_floor() or is_on_wall() :
		emit_signal("activate_gravity")
	
	if motion.x !=0:
		emit_signal("activate_gravity")
	
	if Input.get_action_strength("up"):
		motion.y = FLY
	



func _on_Player_activate_gravity():
	motion.y = GRAVITY

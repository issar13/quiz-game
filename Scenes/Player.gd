extends KinematicBody2D

const GRAVITY = 20
const SPEED = 800
const FLY = -400
const GLIDE = Vector2(0, -1)

var motion = Vector2()

func _physics_process(delta):
	motion = move_and_slide(motion, GLIDE)
	if Input.is_action_pressed("left"):
		motion.x = -SPEED
		$PlayerSprite.flip_h = true
	elif Input.is_action_pressed("right"):
		motion.x = SPEED
		$PlayerSprite.flip_h = false
	else:
		motion.x = 0
	
	if Input.get_action_strength("up"):
			motion.y = FLY
	else:
			motion.y += GRAVITY

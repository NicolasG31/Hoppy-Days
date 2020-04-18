extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1000
const GRAVITY = 100
const jUMP_SPEED = 2000
const UP = Vector2(0, -1)

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if is_on_floor():
		# Applying 5 because there is a bug in is_on_floor()
		motion.y = 5
	else:
		motion.y += GRAVITY

func jump():
	if (Input.is_action_pressed("jump") && is_on_floor()):
		motion.y -= jUMP_SPEED
		
func move():
	if (Input.is_action_pressed("left") && !Input.is_action_pressed("right")):
		motion.x = -SPEED
	elif (Input.is_action_pressed("right") && !Input.is_action_pressed("left")):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)
	

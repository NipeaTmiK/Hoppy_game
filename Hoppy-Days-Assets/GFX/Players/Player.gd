extends KinematicBody2D

var motion = Vector2(0,0)
var jump_count = 0

export var SPEED = 500
export var Gravity = 10
export var jump_power = 350
const UP = Vector2 (0,-1)
	
func _physics_process(delta):
	
	apply_gravity()
	jump()
	walk()
	
	move_and_slide(motion,UP)
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
	
	motion.y += Gravity
	
func jump():
	if jump_count < 1:
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump_power
			jump_count = jump_count + 1
	if is_on_floor():
		jump_count = 0
	
func walk():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x= 0
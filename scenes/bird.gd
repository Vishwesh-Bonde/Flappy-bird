extends CharacterBody2D

const GRAVITY : 	int = 1000
const max_vel : int = 600
const flap_speed : int = -500
var flying : bool = false
var falling : bool = false
const start_pos = Vector2(100,400)
const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _ready():
	reset()
	
	
func reset():
	falling = false
	flying = false
	position = start_pos
	set_rotation(0)
	

func _physics_process(delta):
	# Add the gravity.
	if flying or falling:
		velocity.y += GRAVITY * delta

	# Handle jump.
		if velocity.y > max_vel:
			velocity.y = max_vel
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.05))
			$AnimatedSprite2D.play()
		elif falling:
			set_rotation(PI/2)
			$AnimatedSprite2D.stop()
		move_and_collide(velocity * delta)	
	else:
		$AnimatedSprite2D.stop()
func flap():
	velocity.y = flap_speed

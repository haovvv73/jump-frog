extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -750.0 
const ACCELERATE = 800.0 #  s/giay2 
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

# run every second 1m = 60s
func _physics_process(delta: float) -> void:
	# Animation
	if velocity.x > 0 || velocity.x < 0:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		#velocity.x = direction * SPEED
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATE * delta)
	else:
			velocity.x = move_toward(velocity.x, 0, 50)

	move_and_slide()
	
	# change style
	var is_run_left = velocity.x < 0
	var is_stop = velocity.x == 0
	if !is_stop:
		sprite_2d.flip_h = is_run_left
	

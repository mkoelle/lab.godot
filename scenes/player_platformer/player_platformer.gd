extends CharacterBody2D

var gravity = 300
var maxHorizontalSpeed := 140
var horizontalAcceleration := 2000
var jumpSpeed := 360
var jumpTerminationMultiplier = 4

func _ready():
	pass


func _process(delta):
	var moveVector= get_movement_vector()
	var vec = velocity
	# vec.x += moveVector.x * horizontalAcceleration *delta
	# if (moveVector.x == 0):
	#	var bee =pow(2, -50 * delta)
	#	vec.x = lerp(0, vec.x, bee)
	#	vec.x = clamp(vec.x, -maxHorizontalSpeed, maxHorizontalSpeed)
	if (moveVector.y < 0 && is_on_floor()):
		vec.y = moveVector.y * jumpSpeed
	if (vec.y < 0 && !Input.is_action_pressed("shoot")):
		vec.y += gravity * jumpTerminationMultiplier * delta
	else:
		vec.y += gravity * delta
	velocity = vec
	move_and_slide()


func get_movement_vector() -> Vector2:
	var moveVector := Vector2.ZERO
	moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	moveVector.y = -1 if Input.is_action_just_pressed("shoot") else 0
	return moveVector

extends CharacterBody2D

var velocity := Vector2.ZERO
var maxHorizontalSpeed := 140
var horizontalAcceleration := 2000
var jumpSpeed := 360
var jumpTerminationMultiplier = 4

func _ready():
	pass
	
func _process(delta):
	var moveVector := Vector2.ZERO
	moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	moveVector.y = -1 if Input.is_action_just_pressed("shoot") else 0

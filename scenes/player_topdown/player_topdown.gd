extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_position := Vector2(0,1)

@onready var animation_tree := $AnimationTree
@onready var animation_state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_parameters(starting_position)

func _physics_process(_delta):
	var input_direction := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")		
	)
	update_animation_parameters(input_direction)
	
	velocity= input_direction * move_speed
	
	move_and_slide()
	pick_animation_state()


func update_animation_parameters(move_input : Vector2) -> void:
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)		

func pick_animation_state() -> void:
	if(velocity != Vector2.ZERO):
		animation_state_machine.travel("Walk")
	else:
		animation_state_machine.travel("Idle")

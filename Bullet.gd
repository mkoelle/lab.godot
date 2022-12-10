extends Area2D

class_name Bullet

var speed: float = 20.0

func _physics_process(delta):
	position += transform.x * speed

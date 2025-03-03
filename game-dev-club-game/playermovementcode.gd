extends Node2D

@export var speed: float = 500.0

func _process(delta: float) -> void:
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 50

	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	position += direction * speed * delta

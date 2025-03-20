extends CharacterBody2D

@export var gravity: float = 800.0 
@export var jump_force: float = 400.0 
@export var max_fall_speed: float = 600.0 
@export var move_speed: float = 200.0 
@onready var anim = $CatPlayerCharacter



func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.y = min(velocity.y, max_fall_speed)
	
	var direction = 0
	if Input.is_action_pressed("move_left"):
		anim.play("CatPlayerCharacter_Jump_From_Run_Animation")
		direction = -1
	elif Input.is_action_pressed("move_right"):
		anim.play("CatPlayerCharacter_Jump_From_Run_Animation")
		direction = 1
	elif Input.is_action_just_released("move_left"):
		anim.stop()
	elif Input.is_action_just_released("move_right"):
		anim.stop()
	
	velocity.x = direction * move_speed
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jump_force

	move_and_slide()

extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var turnRight = false;
var turnLeft = false;
var down = false;
var up = false;

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_right") and !turnLeft and !turnRight:
		velocity.x = 1 * SPEED;
		$AnimatedSprite2D.play("startTurnRight");
		turnRight = true;
	elif Input.is_action_pressed("ui_left") and !turnRight and !turnLeft:
		velocity.x = -1 * SPEED;
		$AnimatedSprite2D.play("startTurnLeft");
		turnLeft = true;
	elif Input.is_action_pressed("ui_down") and !up and !down:
		velocity.y = 1 * SPEED;
		down = true;
	elif Input.is_action_pressed("ui_up") and !down and !up:
		velocity.y = -1 * SPEED;
		up = true;
		
			
	if Input.is_action_just_released("ui_right") and turnRight:
		velocity.x = 0;
		$AnimatedSprite2D.play("endTurnRight");
		turnRight = false;
	elif Input.is_action_just_released("ui_left") and turnLeft:
		velocity.x = 0;
		$AnimatedSprite2D.play("endTurnLeft");
		turnLeft = false;
	elif Input.is_action_just_released("ui_down") and down:
		velocity.y = 0;
		down = false;
	elif Input.is_action_just_released("ui_up") and up:
		velocity.y = 0;
		up = false;
		

	move_and_slide()

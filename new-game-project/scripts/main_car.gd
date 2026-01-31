extends CharacterBody2D


const SPEED = 1600.0
const MAX_Y_SPEED = 800
const JUMP_VELOCITY = -400.0
var has_exploded = false


func _physics_process(delta: float) -> void:
	if has_exploded:
		velocity.x = 0
		velocity.y = 2000
		move_and_slide()
		return
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	velocity = Vector2(x_direction, y_direction)
	velocity = velocity.normalized()
	velocity *= SPEED
	
	if velocity.y < -MAX_Y_SPEED:
		velocity.y = -MAX_Y_SPEED
	

	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var f = randf()
		if f < 0.025:
			$Scream.play()
		elif f < 0.05:
			$Scream2.play()

			
		$AudioStreamPlayer2D.play()
		$AnimatedSprite2D.play('die')
			
		has_exploded = true
		#get_tree().paused=true
		
		
		
	

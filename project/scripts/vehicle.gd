extends AnimatableBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var posval = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	posval = Vector2(posval.x,posval.y+2)
	global_position=posval
	#global_position.y += 5;
	pass


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.

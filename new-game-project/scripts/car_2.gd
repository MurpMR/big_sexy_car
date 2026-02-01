extends AnimatableBody2D

@export var speed: float
@onready var posval = global_position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	posval = Vector2(posval.x,posval.y)
	global_position=posval
	global_position.y += (speed/delta)/60

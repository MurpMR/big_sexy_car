extends Sprite2D
var mousepositoion

@export var veichle: PackedScene
@export var point: Marker2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	pass

func _on_timer_timeout():
	var node = veichle.instantiate()
	node.global_position = Vector2(-global_position.x+(randi_range(0,2)*215)+5, -global_position.y)
	add_child(node)

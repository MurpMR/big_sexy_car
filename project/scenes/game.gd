extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@export var veichle: PackedScene
@export var point: Marker2D
@export var viewer: Sprite2D
@export var testvar: AnimatedSprite2D


#func _on_timer_timeout():
	#var node = veichle.instantiate()
	#node.global_position = Vector2(point.global_position.x, point.global_position.y)
	#testvar.add_child(node)

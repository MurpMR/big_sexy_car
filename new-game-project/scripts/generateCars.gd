extends Node2D

@export var car2: PackedScene
@export var point: Marker2D

#var[spawn_range]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout():
	var newCar = car2.instantiate()
	newCar.global_position = Vector2(point.global_position.x+randi_range(1,1500), point.global_position.y)
	add_child(newCar)
	

extends Sprite2D

@export var car2: PackedScene
var spawner_list


#var[spawn_range]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawner_list = get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()

func _on_timer_timeout():
	var newCar = car2.instantiate()
	
	newCar.global_position = spawner_list.pick_random().global_position - 2*global_position
	
	
	newCar.global_position.x += randf() * 100 - 50
	newCar.global_position.x += randf() * 100 - 50
	newCar.global_position.x += randf() * 100 - 50
	newCar.global_position.x += randf() * 100 - 50
	#newCar.global_position.x += randf() * 100 - 50
	
	newCar.speed = 25
	newCar.speed += randf()*10-5
	newCar.speed += randf()*10-5
	newCar.speed += randf()*10-5
	add_child(newCar)
	


func _on_car_show() -> void:
	clip_children = CLIP_CHILDREN_DISABLED

extends Node2D
var score: int
var stopped = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_car_died() -> void:
		get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_second_timeout() -> void:
	if stopped:
		return
	score += 1
	var seconds = score % 60
	
	
	
	var time = str(seconds)
	if len(time) == 1:
		time = "0" + time
		
	if score > 59:
		var minutes = floor(score/60)%60
		time = str(minutes) + ":"+time
		if len(time) == 4:
			time = "0" + time
			
	if score > 3599:
		var hours = floor(score/3600)
		time = str(hours) + ":"+time
		
	$Label.text = time


func _on_car_show() -> void:
	stopped = true

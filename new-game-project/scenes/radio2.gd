extends Node2D

var music
var music2
var alerts
var music_n
var alerts_n
var music_i = 0
var alerts_i = 0
var volume


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music    = $Music.get_children()
	music2    = $Music.get_children()
	alerts   = $Alert.get_children()
	music_n  = $Music.get_child_count()
	alerts_n = $Alert.get_child_count()
	shuffle_songs()
	shuffle_alerts()
	
func _on_h_slider_value_changed(value):
	volume = value
	print(volume)
	if(volume<20):
		music[music_i].volume_db=-volume*2
	if(volume>20):
		music[music_i].
		music2[(music_i+1)%len(music)].volume_db=volume-40
	

	


func shuffle_songs():
	music_i = 0
	music.shuffle()
	music[0].play()
	
func shuffle_alerts():
	alerts_i = 0
	alerts.shuffle()


func music_finished() -> void:
	music_i += 1
	if music_i < music_n:
		music[music_i].play()
		return
	shuffle_songs()


func play_alert() -> void:
	print("playing alert")
	music[music_i].set_stream_paused(true)
	alerts[alerts_i].play()


func alert_finished() -> void:
	$Timer.start()
	music[music_i].set_stream_paused(false)
	alerts_i += 1
	if alerts_i == alerts_n:
		shuffle_alerts()

extends Node2D


@onready var beep_player = $AudioStreamPlayer2D
@onready var timer = $Timer

var target_position = Vector2.ZERO
var max_distance = 300.0
var min_interval = 0.1
var max_interval = 1.0

@onready var main = get_tree().get_root().get_node("MetalDetector")
signal metal_found(metal)
var found
var time_found
var time_to_be_declared_found = 1

func _ready() -> void:
	found = false
	time_found = 0
	connect("metal_found" , Callable(main , "met_found"))
	randomize()
	timer.connect("timeout", Callable(self , "_on_timer_timeout"))
	timer.start()

func _process(delta: float) -> void:
	target_position = self.global_position
	var mouse_pos = get_viewport().get_mouse_position()
	var distance = mouse_pos.distance_to(self.global_position)
	
	
	var volume = clamp(1.0 - distance / max_distance, 0.0 , 0.5 )
	beep_player.volume_db = linear_to_db(volume)
	
	var interval = lerp(min_interval, max_interval, distance / max_distance)
	timer.wait_time = clamp(interval , min_interval , max_interval)
	check_if_found()
	if found:
		time_found += delta
		if time_found >= time_to_be_declared_found:
			metal_found.emit(self)

func _on_timer_timeout() -> void:
	beep_player.play()


func check_if_found():
	if get_viewport().get_mouse_position().distance_to(target_position) < 20:
		found=true
	else:
		found=false
		time_found = 0

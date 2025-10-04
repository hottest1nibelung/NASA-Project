extends Control
@onready var light: PointLight2D = $PointLight2D


const EASE = 0.01
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var difference = mouse_pos - light.global_position
	light.global_position += difference * EASE


func _on_play_butt_pressed() -> void:
	$CanvasLayer/PlayButts.visible = false
	$CanvasLayer/MapButts.visible = true


func _on_exit_butt_pressed() -> void:
	get_tree().quit()

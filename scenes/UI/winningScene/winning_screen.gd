extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _show():
	$CanvasLayer2.visible = true

func _on_continue_butt_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Farm/farm.tscn")

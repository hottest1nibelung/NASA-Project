extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OptionsUI.process_mode = Node.PROCESS_MODE_ALWAYS
	$OptionsUI.visible = false
	$ButtonsAndLabels.process_mode = Node.PROCESS_MODE_ALWAYS


func _on_options_butt_pressed() -> void:
	$OptionsUI.visible = true
	get_tree().paused = true

func _on_close_butt_pressed() -> void:
	$OptionsUI.visible = false
	get_tree().paused = false


func _on_ret_butt_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Farm/farm.tscn")

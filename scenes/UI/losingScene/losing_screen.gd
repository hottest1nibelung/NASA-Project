extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _show():
	$CanvasLayer.visible = true
func _hide():
	$CanvasLayer.visible = false

func _on_retry_butt_pressed() -> void:
	_hide()
	get_tree().paused = false
	get_tree().reload_current_scene()

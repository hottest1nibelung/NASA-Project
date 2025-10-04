extends TextureProgressBar

const GREEN_BAR = preload("uid://c4nuilqpacdwo")
const RED_BAR = preload("uid://cnmgye8caar03")
const YELLOW_BAR = preload("uid://b6s6lswboi4o5")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_progress = GREEN_BAR


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

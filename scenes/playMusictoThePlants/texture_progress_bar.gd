extends TextureProgressBar

const GREEN_BAR = preload("uid://c4nuilqpacdwo")
const RED_BAR = preload("uid://cnmgye8caar03")
const YELLOW_BAR = preload("uid://b6s6lswboi4o5")


func modify_color(progress):
	value = progress
	if progress < 33:
		texture_progress = RED_BAR
	elif progress < 66: texture_progress = YELLOW_BAR
	else: texture_progress = GREEN_BAR
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

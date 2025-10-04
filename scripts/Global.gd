extends Node


@onready var min_x = 25 + 200
@onready var max_x
@onready var max_y

func _ready() -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	max_x = viewport_size.x - 25 - 200
	max_y = viewport_size.y

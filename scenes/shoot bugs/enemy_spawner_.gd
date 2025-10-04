extends "res://scenes/shoot bugs/enemy_spawner.gd"
func _ready() -> void:
	enemy_pos = global_position
	enemy_pos.y = randf_range(0, 1100)

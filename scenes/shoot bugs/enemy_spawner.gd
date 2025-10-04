extends Node2D
@onready var timer: Timer = $Timer
@onready var bug_scene: PackedScene = preload("res://scenes/shoot bugs/bugs.tscn")
@onready var game = get_tree().get_root().get_node("shootBugs")
var enemy_pos

func _ready() -> void:
	timer.wait_time = randf_range(3, 5)
	timer.one_shot = false
	enemy_pos = global_position
	if global_position.x > 1152 or global_position.x < 0:
		enemy_pos.y = randf_range(0, 1100)
	if global_position.y > 648 or global_position.y < 0:
		enemy_pos.x = randf_range(0, 1100)

func _on_timer_timeout() -> void:
	if not game.can_spawn:
		timer.stop()
		return
	game.nr_of_enemies += 1
	var bug = bug_scene.instantiate()
	get_parent().add_child(bug)
	bug.global_position = enemy_pos

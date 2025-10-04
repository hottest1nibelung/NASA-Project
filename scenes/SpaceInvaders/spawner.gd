extends Node2D


var min_time = 0.7
var max_time = 1.5 
@onready var spawn_time: Timer = $SpawnTime
@onready var meteor_scene : PackedScene = load("res://scenes/SpaceInvaders/meteor.tscn")

func _ready() -> void:
	spawn_time.wait_time = randf_range(min_time,max_time)
	spawn_time.start()




func _on_spawn_time_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	add_child(meteor)
	meteor.global_position.x = randf_range(Global.min_x,Global.max_x)
	
	spawn_time.wait_time = randf_range(min_time,max_time)
	spawn_time.start()
	

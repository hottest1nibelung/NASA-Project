extends Node2D
const WINNING_SCREEN = preload("uid://e24pdkg7jh5j")
@onready var timer: Timer = $Timer

var goldLeft = 5;
var gameOver
@onready var goldScene: PackedScene = load("res://scenes/metalDetector/gold.tscn")
const time_till_declared_found = 1.5

func _ready() -> void:
	timer.one_shot = true
	gameOver = false
	for i in range(5):
		var gold = goldScene.instantiate()
		add_child(gold)
		gold.global_position = Vector2(randf_range(0, get_viewport().get_visible_rect().size.x), randf_range(0, get_viewport().get_visible_rect().size.y))
		print(gold.global_position)

func _process(delta: float) -> void:
	if gameOver:
		return
	if goldLeft == 0:
		timer.start()
		gameOver = true
	$PointLight2D.global_position = get_global_mouse_position()
	$CanvasLayer/Label.text = "Metals left to find: " + str(goldLeft)

func met_found(metal):
	print(metal)
	goldLeft -= 1
	metal.queue_free()
	$AudioStreamPlayer2D.play()

func win_game():
	var winning_screen = WINNING_SCREEN.instantiate()
	add_child(winning_screen)
func _on_timer_timeout() -> void:
	win_game()

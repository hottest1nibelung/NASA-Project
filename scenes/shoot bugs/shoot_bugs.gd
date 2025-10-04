extends Node2D
const LOSING_SCREEN = preload("uid://dnsj7vlq5weeg")
const WINNING_SCREEN = preload("uid://e24pdkg7jh5j")

@onready var time_before_game_over: Timer = $timeBeforeGameOver
@onready var label: Label = $Label
var can_spawn = true
var nr_of_enemies = 0

func _ready() -> void:
	time_before_game_over.wait_time = 31
	time_before_game_over.one_shot = true
	time_before_game_over.start()

func _process(delta: float) -> void:
	label.text = "Time until the pest raid stops: " + str(int(time_before_game_over.time_left))
	if nr_of_enemies <= 0 and not can_spawn:
		win_game()
	if $Vegetable.health <= 0:
		loseGame()
func loseGame():
	var lose_scene = LOSING_SCREEN.instantiate()
	lose_scene.global_position = global_position
	add_child(lose_scene)
	get_tree().paused = true

func win_game():
	var win_scene = WINNING_SCREEN.instantiate()
	win_scene.global_position = global_position
	add_child(win_scene)
	get_tree().paused = true


func _on_time_before_game_over_timeout() -> void:
	can_spawn = false

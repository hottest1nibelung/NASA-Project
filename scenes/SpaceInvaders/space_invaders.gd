extends Node2D
@onready var main: Node2D = get_tree().get_root().get_node("SpaceInvaders")
const WINNING_SCREEN = preload("uid://e24pdkg7jh5j")
const LOSING_SCREEN = preload("uid://dnsj7vlq5weeg")
@onready var wait: Timer = $wait

var cnt = 2
var lives = 1
var status = null
var meteors = []

func _ready() -> void:
	wait.wait_time = 1
func _process(delta: float) -> void:
	if status:
		return
	main.get_node("UI/ButtonsAndLabels/CountLabel").text = "Enemies left to kill: " + str(cnt)
	main.get_node("UI/ButtonsAndLabels/LivesLabel").text = "Lives: " + str(lives)
	if cnt <= 0:
		for m in meteors:
			m._destroy()
		wait.start()
		$Drona.can_move = false
		status = "won"
		
	if lives <= 0:
		wait.start()
		print("you lost")
		$Drona.die()
		$Drona.can_move = false
		status = "lost"
		
func laser_hit_enemy():
	cnt -=1

func lose_point():
	lives -=1

func win_game():
	var winning_screen = WINNING_SCREEN.instantiate()
	add_child(winning_screen)
func lose_game():
	var losing_screen = LOSING_SCREEN.instantiate()
	add_child(losing_screen)

func _on_wait_timeout() -> void:
	if status == "won":
		win_game()
	else:
		lose_game()

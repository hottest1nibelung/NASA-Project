extends Node2D
@onready var wait_before_ui: Timer = $Drona/waitBeforeUI

var cnt = 30
var lives = 3
var status = null

func _process(delta: float) -> void:
	if cnt <= 0:
		wait_before_ui.start()
		print("done")
		get_tree().paused = true
		$Drona.can_move = false
		status = "won"
		
	if lives <= 0:
		wait_before_ui.start()
		print("you lost")
		get_tree().paused = true
		$Drona.die()
		$Drona.can_move = false
		status = "lost"
		
func laser_hit_enemy():
	cnt -=1

func lose_point():
	lives -=1


func _on_wait_before_ui_timeout() -> void:
	if status == "won":
		pass
		#show winning screen

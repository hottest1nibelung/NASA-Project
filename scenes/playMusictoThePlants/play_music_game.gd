extends Node2D

const WINNING_SCREEN = preload("uid://e24pdkg7jh5j")
@onready var timer: Timer = $Timer

const FLOWERS = preload("uid://dvvemoj8lmmyr")
@onready var progressBar: TextureProgressBar = $TextureProgressBar
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
"o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

var current_letter
var PLUS_POINT = 5
var progress = 0
var gameOver = false

func  random_letter():
	var rand_index = randi_range(0, letters.size() - 1)
	return letters[rand_index]

func new_letter():
	current_letter = random_letter()
	animation.play(current_letter)
	
func _ready() -> void:
	new_letter()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if gameOver:
		return
	progressBar.modify_color(progress)
	if progress == 100:
		$AnimatedSprite2D.queue_free()
		gameOver = true
		timer.start()
		$CanvasLayer/TextureRect.texture = FLOWERS
	
func key_pressed(key):
	if key == current_letter:
		progress += PLUS_POINT
		new_letter()
	else:
		progress -= PLUS_POINT
	progress = clampi(progress, 0, 100)

func _unhandled_input(event: InputEvent) -> void:
	if gameOver:
		return
	if event is InputEventKey and event.pressed and not event.is_echo():
		key_pressed(event.as_text().to_lower())

func win_game():
	var winning_screen = WINNING_SCREEN.instantiate()
	add_child(winning_screen)


func _on_timer_timeout() -> void:
	win_game()

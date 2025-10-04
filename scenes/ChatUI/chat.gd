extends Control
@onready var animation: AnimatedSprite2D = $CanvasLayer/AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var label: RichTextLabel = $CanvasLayer/RichTextLabel
var typing_speed = 0.07
var current_char
var current_text

func _ready() -> void:
	print("Panaramadwadwwadffwadfggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggwddwadwdwdwdddgggggggggggggggggggggggg".length())
	start_writing("Buna, Amalia!")
	animation.play("talking")
func start_writing(text):
	current_char = 0
	current_text = text
	label.clear()
	timer.wait_time = typing_speed
	timer.start()

func _on_timer_timeout() -> void:
	if current_char < current_text.length():
		label.append_text(current_text[current_char])
		current_char += 1
	else:
		timer.stop()
		animation.play("idle")

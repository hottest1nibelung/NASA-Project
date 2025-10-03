extends CharacterBody2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 300.0
var orientation = 1
var stopped = true
var time_spent_idle = 1
const TIME_BEFORE_RAISING_HANDS = 5
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	if dir:
		animation.play("walk")
		velocity = SPEED * dir
		stopped = false
		move_and_slide()
		if (dir.x < 0 and orientation == 1) or dir.x > 0 and orientation == -1 :
			animation.flip_h = !animation.flip_h
			orientation = -orientation
		time_spent_idle = 1
	else:
		if !stopped:
			stopped = true
			animation.play("idle")
		time_spent_idle += delta
		if int(time_spent_idle) % TIME_BEFORE_RAISING_HANDS == 0:
			time_spent_idle = 1
			animation.play("hands_raised")
			print("yes")

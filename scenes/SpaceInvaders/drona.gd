extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var laserScene: PackedScene = load("res://scenes/SpaceInvaders/laser.tscn")
@onready var level = get_tree().get_root().get_node("SpaceInvaders")
var can_move = true
var can_shoot = true

const SPEED = 300.0

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _physics_process(delta: float) -> void: 
	if not can_move:
		return
	var mouse_position = get_global_mouse_position().x
	if mouse_position >= Global.min_x and mouse_position <= Global.max_x :
		global_position.x = get_global_mouse_position().x
	if Input.is_action_just_pressed("leftclick") and can_shoot:
		can_shoot = false
		$coolDown.start()
		animation.play("shooting")
		var laser = laserScene.instantiate()
		level.add_child(laser)
		laser.global_position = self.global_position
		
func hit_by_meteor():
	print("hit")
	get_tree().get_root().get_node("SpaceInvaders").lose_point()

func die():
	animation.play("death")


func _on_cool_down_timeout() -> void:
	can_shoot = true

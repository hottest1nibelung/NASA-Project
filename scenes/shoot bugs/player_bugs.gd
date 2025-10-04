extends CharacterBody2D

@onready var cooldown_timer: Timer = $cooldown_timer
@onready var laser_scene: PackedScene = load("res://scenes/shoot bugs/laser.tscn")
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
var can_shoot = true
var mouse_pos

func _ready() -> void:
	animation.play("idle")
	cooldown_timer.one_shot = true
	cooldown_timer.wait_time = 0.3

func _physics_process(delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * SPEED
	move_and_slide()
	
	if Input.is_action_just_pressed("leftclick") and can_shoot:
		shoot_laser()

func shoot_laser():
	animation.play("shoot")
	can_shoot = false
	cooldown_timer.start()
	var laser = laser_scene.instantiate()
	get_parent().add_child(laser)
	laser.global_position = $laserSpawnPoint.global_position
	laser.look_at(mouse_pos)
	laser.direction = (mouse_pos - laser.global_position).normalized()
	

func _on_cooldown_timer_timeout() -> void:
	can_shoot = true

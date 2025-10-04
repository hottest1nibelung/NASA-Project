extends Area2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var lifetime: Timer = $lifetime

var direction = Vector2.ZERO
var SPEED = 500.0
func _ready() -> void:
	lifetime.one_shot = true
	lifetime.wait_time = 8.0
	lifetime.start()

func _process(delta: float) -> void:
	global_position += direction * SPEED * delta



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("hit_player"):
		hit_enemy(body)

func hit_enemy(enemy):
	$CollisionShape2D.queue_free()
	animation.play("hit")
	enemy.take_damage()


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()

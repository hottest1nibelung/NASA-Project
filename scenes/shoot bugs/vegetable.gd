extends StaticBody2D

var health = 100

func _ready() -> void:
	$healthBar.value = health
func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.has_method("hit_player"):
		var push_dir = (body.global_position - global_position).normalized()
		var push_strength = 70
		body.push(push_dir, push_strength)
		health -= 10
		$healthBar.value = health
	if health <= 0:
		get_parent().loseGame()

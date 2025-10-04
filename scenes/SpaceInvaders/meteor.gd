extends Area2D

var SPEED = randf_range(200,300)
var freed = false;


func _process(delta: float) -> void:
	global_position.y += SPEED * delta
	if global_position.y > 1000 and not freed:
		get_parent().get_parent().lose_point()
		queue_free()
		freed = true


func player_hit ():
	pass



func _destroy():
	$CPUParticles2D.emitting = false
	$CollisionShape2D.disabled = true
	$KillTime.start()
	collision_layer = 2 
	
func _on_area_entered(area: Area2D) -> void:
	if area.has_method("meteor_hit"):
		_destroy()


func _on_kill_time_timeout() -> void:
	if not freed:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.hit_by_meteor()
	_destroy()

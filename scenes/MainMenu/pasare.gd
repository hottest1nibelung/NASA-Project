extends AnimatedSprite2D
@onready var light = get_tree().get_root().get_node("Main menu").get_node("PointLight2D")
var playing_animation = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.global_position.distance_to(light.global_position) < 60 and not playing_animation:
		playing_animation = true
		play("fly")
		


func _on_animation_finished() -> void:
	playing_animation = false
	frame = 0

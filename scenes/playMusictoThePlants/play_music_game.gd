extends Node2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
"o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
func _ready() -> void:
	var frames = SpriteFrames.new()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

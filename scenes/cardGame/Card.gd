extends TextureButton

class_name Card
@onready var card_game

var image_front
var image_back
var images_names = ["carrot", "eggplant", "peas", "potato", "tomato", "pumpkin", "broccoli", "beetroot"]
var isRemoved
var showing = false

func _ready() -> void:
	card_game = get_tree().get_root().get_node("cardGame")
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	set_ignore_texture_size(true)
	stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED

func _init(img_index) -> void:
	image_front = load("res://scenes/cardGame/cardsFolder/" + images_names[img_index] + ".tres")
	image_back = load("res://scenes/cardGame/cardsFolder/back.tres")
	texture_normal = image_back
	isRemoved = false

func flip():
	if showing:
		showing = false
		texture_normal = image_back
	else:
		showing = true
		texture_normal = image_front

func _pressed() -> void:
	card_game.cardPressed(self)

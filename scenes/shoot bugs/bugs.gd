extends CharacterBody2D
@onready var cs: CollisionShape2D = $CollisionShape2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var vegetable: StaticBody2D = get_tree().get_root().get_node("Vegetable")
@onready var game = get_tree().get_root().get_node("shootBugs")
var veg_global_pos = Vector2(565.0, 282.0)
var orientation = 1
var health = 100
var damage_taken

enum BugSize{SMALL, MEDIUM, BEEG}
@export var size = BugSize.BEEG
var speed
var MAX_SPEED
func _ready() -> void:
	randomize()
	var types = BugSize.values()
	var random_type = types.pick_random()
	size = random_type 
	speed = MAX_SPEED
	match size:
		BugSize.BEEG:
			animation.offset.y = -50
			animation.play("beeg")
			cs.shape = preload("res://resources/cs_beeg.tres")
			damage_taken = 33
			health = 99
			MAX_SPEED = 50
		BugSize.MEDIUM:
			animation.offset.y= -28
			animation.play("medium")
			cs.shape = preload("res://resources/cs_medium.tres")
			MAX_SPEED = 70
			damage_taken = 50
			scale = Vector2(3,3)
		BugSize.SMALL:
			animation.offset.y = -10
			animation.play("small")
			cs.shape = preload("res://resources/cs_small.tres")
			damage_taken = 100
			MAX_SPEED = 100
			scale = Vector2(2.5,2.5)

	speed = MAX_SPEED


func _physics_process(delta: float) -> void:
	if health <= 0:
		queue_free()
		game.nr_of_enemies -= 1
	$healthBar.value = health
	if vegetable == null:
		pass
	var dir = (veg_global_pos - global_position).normalized()
	if (orientation == 1 and dir.x < 0) or (orientation == -1 and dir.x > 0):
		orientation = -orientation
		animation.flip_h = not(animation.flip_h)
	velocity = dir * speed
	move_and_slide()
	speed = clamp(speed + 0.1, speed, MAX_SPEED)
func hit_player():
	pass

func push(dir, strenght):
	global_position +=  dir * strenght
	speed = 50

func take_damage():
	health -= damage_taken
	

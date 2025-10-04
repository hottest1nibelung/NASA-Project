extends Node

@onready var main = get_tree().get_root().get_node("cardGame")
@onready var grid: GridContainer = main.get_node("MarginContainer/GridContainer")
@onready var timer: Timer = main.get_node("LookAtCards_timer")
const WINNING_SCREEN = preload("uid://e24pdkg7jh5j")
const LOSING_SCREEN = preload("uid://dnsj7vlq5weeg")

var nrPairs = 0
var gameOver = false
var score = 0
var nr_of_cards = 8

var card1 = null
var card2 = null
var deck = []

func _ready() -> void:
	nrPairs = 15
	gameOver = false
	timer.wait_time = 1
	timer.one_shot = true
	timer.connect("timeout", compareCards)
	startGame()

func _process(delta: float) -> void:
	if nrPairs == 16:
		gameOver = true
		

func cardPressed(c):
	if c ==  card1:
		return
	if c.isRemoved:
		return
	if card2 != null:
		return
	
	if card1 == null:
		card1 = c
		c.flip()
	else:
		card2 = c
		c.flip()
		timer.start()

func compareCards():
	if card1.image_front == card2.image_front:
		card1.isRemoved = true
		card2.isRemoved = true
		card1.modulate = Color(0.868, 0.67, 0.739, 1.0)
		card2.modulate = Color(0.868, 0.67, 0.739, 1.0)
		card1 = null
		card2 = null
		score +=1
		nrPairs+= 1
	else:
		card1.flip()
		card2.flip()
		card1 = null
		card2 = null

func startGame ():
	if deck.size() > 0:
		for i in grid.get_children():
			i.queue_free()
	deck.clear()
	
	for i in range(nr_of_cards):
		for j in range(4):
			var card = Card.new(i)
			deck.append(card)
	deck.shuffle()

	for card in deck:
		grid.add_child(card)

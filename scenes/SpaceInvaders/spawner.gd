extends Node2D

var meteorNames = ["NWA 7034", "NWA 869", "NWA 998", "NWA 2737", "NWA 1950","Allende", "Chelyabinsk", "Hoba", "Murchison", "Orgueil", "Tagish Lake", "Campo del Cielo", "Sikhote-Alin", "Ensisheim", "Nantan",
"Gibeon", "Toluca", "Canyon Diablo", "Muonionalusta", "Tissint", "Zagami", "Shergotty", "Chassigny", "Nakhla", "Kaidun",
"Brenham", "Admire", "Glorieta Mountain", "Brahin", "Esquel", "Imilac", "Sericho", "Fukang", "Jepara", "Marjalahti",
"Krasnojarsk", "Mundrabilla", "Henbury", "Wolf Creek", "Dalgaranga", "Tenham", "Millbillillie", "Juvinas", "Bouvante", "Aubres",
"Saint-Sauveur", "Ornans", "Krymka", "Albareto", "Tatahouine", "Angra dos Reis", "Norton County", "Mount Egerton", "Dhofar 019", "Sayh al Uhaymir 001",
"Dar al Gani 476", "Dar al Gani 400", "Allan Hills 84001", "Allan Hills 77005", "EETA79001", "NWA 7034", "NWA 869", "NWA 998", "NWA 2737", "NWA 1950",
"Millbillillie", "Kapoeta", "Pasamonte", "Bununu", "Buzzard Coulee", "Peekskill", "Bassikounou", "Carancas", "Gao-Guenie", "Katol",
"Kunya-Urgench", "Almahata Sitta", "Bishunpur", "Chainpur", "Dhajala", "Pillistfer", "Kabo", "Kunashak", "Shikarpur", "Lodran",
"Acapulco", "Winona", "Gujba", "Bencubbin", "Norton County", "Pena Blanca Spring", "Abee", "Indarch", "Happy Canyon", "Pallasovka",
"Seeläsgen", "Ural Mountains", "Dimmitt", "Forest City", "Homestead", "Novato", "Cold Bokkeveld", "Famenin", "Dashoguz", "Wold Cottage"]
var unusedNames = meteorNames

func randomName():
	var index = randi_range(0, unusedNames.size()-1)
	return unusedNames[index]

var min_time = 0.7
var max_time = 1.5 
@onready var spawn_time: Timer = $SpawnTime
@onready var meteor_scene : PackedScene = load("res://scenes/SpaceInvaders/meteor.tscn")

func _ready() -> void:
	spawn_time.wait_time = randf_range(min_time,max_time)
	spawn_time.start()
func _process(delta: float) -> void:
	if get_parent().status:
		spawn_time.stop()

func giveName(meteor):
	if unusedNames.size() == 0:
		unusedNames = meteorNames
	var _name = randomName()
	meteorNames.erase(_name)
	meteor.giveName(_name)

func _on_spawn_time_timeout() -> void:
	if get_parent().status:
		spawn_time.stop()
		return
	var meteor = meteor_scene.instantiate()
	add_child(meteor)
	meteor.global_position.x = randf_range(Global.min_x,Global.max_x)
	giveName(meteor)
	get_parent().meteors.append(meteor)
	
	spawn_time.wait_time = randf_range(min_time,max_time)
	spawn_time.start()
	

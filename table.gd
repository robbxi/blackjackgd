extends Node2D

@export var Deck = []
@export var Dealer = []
@export var Player = []
@export var playing = true

func initDeck():
	Dealer.clear()
	Player.clear()
	Deck.clear()
	for suit in range(0,4):
		for rank in range(1,14):
			var newCard = get_node("Card").duplicate()
			newCard.suit = suit
			newCard.rank = rank
			newCard.faceUp = false
			Deck.append(newCard)
			
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

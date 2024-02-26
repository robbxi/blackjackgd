

extends Node2D

enum Suit {
	HEART,
	DIAMOND,
	CLUB,
	SPADES
}

@export var suit : Suit = Suit.HEART
@export var rank : int = 1
@export var faceUp : bool = true

var Red = Color(1, 0, 0, 1)
var Black = Color(0, 0, 0, 1)


func displayCard(suit,rank,faceUp):
	self.propagate_call("set_visible", [false])
	if not faceUp:
		var front = get_node("Front")
		var back = get_node("Back")
		front.visible = false
		back.visible = true
		return
		
	get_node("Front").visible = true
	var rankNode = get_node("Front/Rank")
	
	if rankNode:
		var topLabel = rankNode.get_node("Top")
		var bottomLabel = rankNode.get_node("Bottom")
		if topLabel and bottomLabel:
			if suit == Suit.HEART or suit == Suit.DIAMOND:
				topLabel.label_settings.font_color = Red
				bottomLabel.label_settings.font_color = Red
			else:
				topLabel.modulate = Black
				bottomLabel.modulate = Black
				
				
			
			if rank == 1:
				topLabel.text = "A"
				bottomLabel.text = "A"
			elif rank < 11:
				topLabel.text = str(rank)
				bottomLabel.text = str(rank)
			elif rank == 11:
				topLabel.text = "J"
				bottomLabel.text = "J"
			elif rank == 12:
				topLabel.text = "Q"
				bottomLabel.text = "Q"
			else:
				topLabel.text = "K"
				bottomLabel.text = "K"
		else:
			print("Top or bottom not found")
	else:
		print("Rank Node not found")
	
	rankNode.propagate_call("set_visible", [true])
	var suitNode;
	if suit == Suit.HEART:
		suitNode = get_node("Front/Hearts")
	elif suit == Suit.DIAMOND:
		suitNode = get_node("Front/Diamonds")
	elif suit == Suit.CLUB:
		suitNode = get_node("Front/Clubs")
	elif suit == Suit.SPADES:
		suitNode = get_node("Front/Spades")
	
	suitNode.visible = true
	suitNode.get_node("Small").propagate_call("set_visible", [true])
	
	if rank < 11:
		suitNode.get_node("Numbers").visible = true
	if rank == 1:
		var ace = suitNode.get_node("Numbers/Ace")
		ace.propagate_call("set_visible", [true])
	elif rank == 2:
		suitNode.get_node("Numbers/Two").propagate_call("set_visible", [true])
	elif  rank == 3:
		suitNode.get_node("Numbers/Ace").propagate_call("set_visible", [true])
		suitNode.get_node("Numbers/Two").propagate_call("set_visible", [true])
	elif rank == 4:
		suitNode.get_node("Numbers/Four").propagate_call("set_visible", [true])
	elif rank == 5:
		suitNode.get_node("Numbers/Ace").propagate_call("set_visible", [true])
		suitNode.get_node("Numbers/Four").propagate_call("set_visible", [true])
	elif rank == 6:
		suitNode.get_node("Numbers/Six").propagate_call("set_visible", [true])
	elif rank == 7:
		suitNode.get_node("Numbers/Six").propagate_call("set_visible", [true])
		suitNode.get_node("Numbers/Seven").propagate_call("set_visible", [true])
	elif rank == 8:
		suitNode.get_node("Numbers/Eight").propagate_call("set_visible", [true])
	elif rank == 9:
		suitNode.get_node("Numbers/Eight").propagate_call("set_visible", [true])
		suitNode.get_node("Numbers/Seven").propagate_call("set_visible", [true])
	else:
		suitNode.get_node("Numbers/Eight").propagate_call("set_visible", [true])
		suitNode.get_node("Numbers/Ten").propagate_call("set_visible", [true])
		
func addCard():
	displayCard(suit,rank,faceUp)
	self.visible = true
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.


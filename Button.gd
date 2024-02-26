extends Button

var cards = 0

func _pressed():
	print("asdfasdf")
	var dealers = get_parent().get_node("Container")
	var newCard = get_parent().get_node("Card").duplicate()
	newCard.suit = 1
	newCard.rank = 9
	newCard.faceUp = true
	cards+=1
	newCard.position.x += 130*cards
	dealers.add_child(newCard)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Button

var cards = -1

func _pressed():
	var player = get_parent().get_node("Player")
	if player.score < 21:
		var random = randi_range(0,len(get_parent().Deck)-1)
		var newCard = get_parent().Deck[random]
		cards+= 1
		print(len(get_parent().Player))
		newCard.position.x += 130*len(get_parent().Player)
		newCard.faceUp = true
		player.add_child(newCard)
		get_parent().Player.append(newCard)
		newCard.addCard()
		if newCard.rank < 11:
			player.score += newCard.rank
		else:
			player.score += 10
	if player.score > 21:
		get_parent().get_node("Stand").visible = false
		get_parent().get_node("Hit").visible = false
		get_parent().get_node("Lose").visible = true
		get_parent().get_node("Start").visible = true
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

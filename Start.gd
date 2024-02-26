extends Button

var cards = -1
func _pressed():
	get_parent().get_node("Lose").visible = false
	get_parent().get_node("Win").visible = false
	get_parent().get_node("Player").initPlayer()
	get_parent().get_node("Dealer").initDealer()
	for c in get_parent().get_node("Player").get_children():
		get_parent().get_node("Player").remove_child(c)
		c.queue_free()
	for n in get_parent().get_node("Dealer").get_children():
		get_parent().get_node("Dealer").remove_child(n)
		n.queue_free()
	get_parent().initDeck()
	self.visible = false
	get_parent().get_node("Hit").visible = true
	get_parent().get_node("Stand").visible = true
	var dealer = get_parent().get_node("Dealer")
	var random = randi_range(0,len(get_parent().Deck)-1)
	var newCard = get_parent().Deck[random]
	get_parent().Deck.remove_at(random)
	newCard.faceUp = true
	dealer.add_child(newCard)
	get_parent().Dealer.append(newCard)
	newCard.addCard()
	if newCard.rank < 11:
		dealer.score += newCard.rank
	else:
		dealer.score += 10
	
	random = randi_range(0,len(get_parent().Deck)-1)
	newCard = get_parent().Deck[random]
	get_parent().Deck.remove_at(random)
	newCard.faceUp = false
	newCard.position.x += 130*len(get_parent().Dealer)
	dealer.add_child(newCard)
	get_parent().Dealer.append(newCard)
	newCard.addCard()
	
	if newCard.rank < 11:
		dealer.score += newCard.rank
	else:
		dealer.score += 10
	
	
	var player = get_parent().get_node("Player")
	random = randi_range(0,len(get_parent().Deck)-1)
	newCard = get_parent().Deck[random]
	get_parent().Deck.remove_at(random)
	newCard.faceUp = true
	player.add_child(newCard)
	get_parent().Player.append(newCard)
	newCard.addCard()
	if newCard.rank < 11:
		player.score += newCard.rank
	else:
		player.score += 10
	
	random = randi_range(0,len(get_parent().Deck)-1)
	newCard = get_parent().Deck[random]
	get_parent().Deck.remove_at(random)
	newCard.faceUp = true
	newCard.position.x += 130
	player.add_child(newCard)
	get_parent().Player.append(newCard)
	newCard.addCard()
	if newCard.rank < 11:
		player.score += newCard.rank
	else:
		player.score += 10
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

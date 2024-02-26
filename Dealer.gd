extends Container

@export var score = 0
@export var Cards = []
@export var playing = true
# Called when the node enters the scene tree for the first time.
func initDealer():
	score = 0
	Cards.clear()
	
func deal():
	var first = true
	get_parent().get_node("Hit").visible = false
	get_parent().get_node("Stand").visible = false
	if !get_parent().playing:
		if first:
			var hidden = get_parent().Dealer[1]
			hidden.faceUp = true
			hidden.addCard()
			await get_tree().create_timer(2).timeout
			first = false
		while score < 17:
			var random = randi_range(0,len(get_parent().Deck))
			var newCard = get_parent().Deck[random]
			get_parent().Deck.remove_at(random)
			newCard.position.x += 130*len(get_parent().Dealer)
			newCard.faceUp = true
			self.add_child(newCard)
			get_parent().Dealer.append(newCard)
			newCard.addCard()
			print(score)
			if newCard.rank < 11:
				score += newCard.rank
			else:
				score += 10
			await get_tree().create_timer(2).timeout
		if score > 21:
			get_parent().get_node("Win").visible = true
		elif score < get_parent().get_node("Player").score:
			get_parent().get_node("Win").visible = true
		else:
			get_parent().get_node("Lose").visible = true
		get_parent().get_node("Start").visible = true
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
			
			
	pass

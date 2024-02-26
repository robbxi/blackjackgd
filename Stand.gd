extends Button

func _pressed():
	get_parent().playing = false
	get_parent().get_node("Hit").visible = false
	get_parent().get_node("Dealer").deal()
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

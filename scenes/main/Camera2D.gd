extends Camera2D

var cart_position



func _ready():
	var cart = get_parent().get_node("player/Cart")
	# A stoopid way to get the cart position
	# from within an instanciated scene
	cart.connect("cart_pos", _cart_update)
	
func _cart_update(pos):
	cart_position = pos

func _process(_delta):
	# don't move camera up or down
	# have it a little in front of cart
	position.x = cart_position.x + 300

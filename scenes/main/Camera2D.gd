extends Camera2D

var cart_position
signal game_over()

var still_going = true


func _ready():
	var cart = get_parent().get_node("player/Cart")
	# A stoopid way to get the cart position
	# from within an instanciated scene
	cart.connect("cart_pos", _cart_update)
	
func _cart_update(pos,gpos):
	if still_going:
		cart_position = pos
		#print('pos',pos)
		#print('global',gpos)
		if gpos.y > 1080:
			emit_signal("game_over","dead",pos.x)
			still_going = false
	

func _process(_delta):
	# don't move camera up or down
	# have it a little in front of cart
	position.x = cart_position.x + 300

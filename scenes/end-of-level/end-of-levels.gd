extends Node2D

var menuButton = load("res://scenes/menu-button/menu-button.tscn")

var button = null
var callback = null



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func showButton(xcoord, dead_or_alive):
	print("showing fancy end of level button")
	button = menuButton.instantiate()
	var text_index = 4
	if dead_or_alive == "dead":
		text_index = 6
	button.set_icon_normal_hover(text_index)
	button.position.x = xcoord # 1920/2 
	button.position.y = 150 # 1080/2 
	button.button_pressed.connect(button_pressed)
	add_child(button)
	
func removeButton():
	if button != null:
		button.queue_free()

func on_done(cb):
	callback = cb
	
func button_pressed(_butt):
	print("button pressed")
	if callback != null:
		callback.call()

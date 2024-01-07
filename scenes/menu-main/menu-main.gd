extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# get all children and their signals
	for kid in self.get_children():
		if (kid.has_meta('is_button')):
			kid.button_pressed.connect(kid_button_pressed)

func kid_button_pressed(item):
	#print('item ' + item.name + ' pressed')
	match (item.name):
		'play':
			#print("play")
			SceneTransition.change_scene("res://scenes/main/main.tscn")
		'quit':
			get_tree().quit()
		'fullscreen':
			var mode = DisplayServer.window_get_mode()
			if mode == DisplayServer.WINDOW_MODE_WINDOWED:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN )
			else:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			

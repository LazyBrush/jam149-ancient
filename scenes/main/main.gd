extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("setup_tilemap_extras")

func setup_tilemap_extras():
	var tiles = %mine.get_children(true)
	for t in tiles:
		print("child: " + t.name)
		if t.has_meta("whatami"):
			var meta = null
			meta = t.get_meta("whatami")
			print("meta: " + meta)
			if meta == "exit":
				t.got_out_ok.connect(got_to_exit)

func got_to_exit():
	print("got to exit, yay")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_camera_2d_game_over(status, length):
	print(status)
	print(length)
	print("we died, boo")
	

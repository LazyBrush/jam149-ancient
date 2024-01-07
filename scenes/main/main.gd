extends Node2D

var dialog = null
var exit_xcoord = null

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
				exit_xcoord = t.position.x

func got_to_exit():
	# We won
	print("got to exit, yay")
	call_deferred("_on_show_level_success_state_entered_deferred", exit_xcoord, "alive")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_camera_2d_game_over(status, xcoord):
	# We died
	call_deferred("_on_show_level_success_state_entered_deferred", xcoord, "dead")
	
func _on_show_level_success_state_entered_deferred(xcoord, dead_or_alive):
	print("showing success button")
	var success_msg = preload("res://scenes/end-of-level/end-of-levels.tscn")
	# global, pah
	dialog = success_msg.instantiate()
	dialog.on_done(_on_done_success_level_dialog)
	dialog.showButton(xcoord, dead_or_alive)
	add_child(dialog)
	# Make the background focus on button
	# %ColorRect.focus_on_button()
	
func _on_done_success_level_dialog():
	print("callback called")
	# go to main menu
	SceneTransition.change_scene("res://scenes/menu-main/menu-main.tscn")
	# %ColorRect.focus_reset()

@tool
extends Node2D

@export var startIcon = 0

signal button_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	%Sprite2D.set_frame(startIcon)

# @tool code
# A bit quirky.  We have buttons which are taken from a svg.
# Initially, the 'frame' of the sprite is set to 0.  But in 
# the editor 2D view, we want to see the one set in the properties
# rather than the first icon on the sheet.  The @tool at the
# start of this file means it runs both during game AND in the editor.
func _process(_delta):
	if Engine.is_editor_hint():
		if %Sprite2D.frame != startIcon:
			%Sprite2D.set_frame(startIcon)

func set_icon_normal_hover(normal):
	startIcon = normal
	%Sprite2D.set_frame(startIcon)
	

func _on_area_2d_mouse_entered():
	# print('m enter')
	%Sprite2D.set_frame(startIcon+1)


func _on_area_2d_mouse_exited():
	# print('m leave')
	%Sprite2D.set_frame(startIcon)

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	# print('event')
	if event is InputEventMouseButton:
		if event.pressed:
			# print("event pressed")
			button_pressed.emit(self)

extends RigidBody2D

signal cart_pos()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("space bar")
		apply_central_impulse(Vector2(0,-300))
	if Input.is_action_just_pressed("ui_right"):
		print("faster")
		apply_central_impulse(Vector2(200,0))
	if Input.is_action_just_pressed("ui_left"):
		print("slower")
		apply_central_impulse(Vector2(-100,0))
	emit_signal("cart_pos", position, global_position)
	

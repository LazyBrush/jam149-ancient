extends RigidBody2D

signal cart_pos()

var jump_cooldown = 0
var thrust_cooldown = 0

const JUMP_MAX = 15
const THRUST_MAX = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_just_pressed("ui_accept") and jump_cooldown == 0:
		# print("space bar")
		apply_central_impulse(Vector2(0,-300))
		jump_cooldown = JUMP_MAX
		
	if Input.is_action_just_pressed("ui_right") and thrust_cooldown == 0:
		# print("faster")
		apply_central_impulse(Vector2(200,0))
		thrust_cooldown = THRUST_MAX
		
	if Input.is_action_just_pressed("ui_left") and thrust_cooldown == 0:
		# print("slower")
		apply_central_impulse(Vector2(-100,0))
		thrust_cooldown = THRUST_MAX
		
	emit_signal("cart_pos", position, global_position)
	
	jump_cooldown -= 1
	jump_cooldown = clamp(jump_cooldown, 0, JUMP_MAX)
	thrust_cooldown -= 1
	thrust_cooldown = clamp(thrust_cooldown, 0, THRUST_MAX)

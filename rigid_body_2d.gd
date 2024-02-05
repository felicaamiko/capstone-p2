extends RigidBody2D

var isHovered = false
var selected = false
var mouseoffset = Vector2(0,0)
var firstframe = true
var prevmousepos = Vector2(0,0)
var mousepos = Vector2(0,0)
var lastvector = Vector2(0,0)
var lastvectorcopy = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("click"):
		#mouseoffset = position - get_global_mouse_position()
	prevmousepos = mousepos
	mousepos = get_global_mouse_position()
	lastvector = (mousepos-prevmousepos)
	#print_debug(lastvector)
	if (isHovered == true and Input.is_action_pressed("click")):#held down
		if (firstframe):
			mouseoffset = position - get_global_mouse_position()
			firstframe = false
		#print_debug("held down")
		position = get_global_mouse_position() + mouseoffset
		prevmousepos = get_global_mouse_position()
	else:
		linear_velocity = lastvector
		#if (not firstframe):
			#lastvectorcopy = lastvector
			#position += lastvectorcopy
			#firstframe = true
		#lastvectorcopy *= .75
		#position += lastvectorcopy #changing to a - makes cool slingshot effect.
		#print_debug(lastvectorcopy)
		#position += (prevmousepos-(get_global_mouse_position()))

func _on_area_2d_mouse_entered():
	print_debug("entered")
	isHovered = true

func _on_area_2d_mouse_exited():
	print_debug("exited")
	isHovered = false

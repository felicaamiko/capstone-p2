extends RigidBody2D

var isHovered = false
var mouseoffset = Vector2(0,0)
var firstframe = true
var prevmousepos = Vector2(0,0)
var mousepos = Vector2(0,0)
var lastvector = Vector2(0,0)
var lastvectorcopy = Vector2(0,0)

func _ready():
	pass

func _physics_process(delta):
	prevmousepos = mousepos
	mousepos = get_global_mouse_position()
	lastvector = (mousepos-prevmousepos)
	
	
	if (isHovered and Input.is_action_pressed("click")):#held down
		apply_impulse(position, lastvector)
		#if (firstframe):
			#mouseoffset = position - get_global_mouse_position()
			#firstframe = false
		#position = get_global_mouse_position() + mouseoffset
		prevmousepos = get_global_mouse_position()
	else:
		if (not firstframe):
			linear_velocity = lastvector
			lastvectorcopy *= .5
			if (lastvectorcopy == Vector2(0,0)):
				firstframe = true

func _on_area_2d_mouse_entered():
	print_debug("entered")
	isHovered = true

func _on_area_2d_mouse_exited():
	print_debug("exited")
	isHovered = false

extends RigidBody2D

var isHovered = false
var mouseoffset = Vector2(0,0)
var firstframe = true
var prevmousepos = Vector2(0,0)
var mousepos = Vector2(0,0)
var lastvector = Vector2(0,0)
var lastvectorcopy = Vector2(0,0)
var sensitivity = 10000

var untilsixty = 0


func _ready():
	pass

func _physics_process(delta):
	prevmousepos = mousepos
	mousepos = get_global_mouse_position()
	lastvector = (mousepos-prevmousepos)
	print_debug(lastvector)
	
	if (isHovered and Input.is_action_pressed("click") and firstframe == true):#held down first frame
		apply_force(lastvector * sensitivity, Vector2(0,0))
		#apply_impulse(lastvector, position)
		untilsixty += 1
		#if (untilsixty > 60):
			#firstframe = false
			#untilsixty = 0
	else:
		if (not firstframe):
			#linear_velocity = lastvector"linear_damp_mode"
			if (lastvector == Vector2(0,0)):
				firstframe = true
		#pass

func _on_area_2d_mouse_entered():
	print_debug("entered")
	isHovered = true

func _on_area_2d_mouse_exited():
	print_debug("exited")
	isHovered = false

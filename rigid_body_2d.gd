extends RigidBody2D

var isHovered = false
var mouseoffset = Vector2(0,0)
var firstframe = true
var prevmousepos = Vector2(0,0)
var mousepos = Vector2(0,0)
var lastvector = Vector2(0,0)
var sqrtsenslastvector = Vector2(0,0)
var sensitivity = 500
var horizdir = 1 #returns 1 if headed right, -1 if headed left
var vertdir = 1 #returns 1 if headed up, -1 if headed down

var untilsixty = 0

func _ready():
	pass

func _physics_process(delta):
	if lastvector.x < 0:
		horizdir = -1
	else:
		horizdir = 1
	
	if lastvector.y < 0:
		vertdir = -1
	else: vertdir = 1
	prevmousepos = mousepos
	mousepos = get_global_mouse_position()
	lastvector = (mousepos-prevmousepos)
	#print_debug(lastvector.x)
	sqrtsenslastvector = Vector2(sqrt(abs(lastvector.x)) * horizdir, sqrt(abs(lastvector.y)) * vertdir) * sensitivity
	if (isHovered and Input.is_action_pressed("click") and firstframe == true):#held down first frame
		apply_force(sqrtsenslastvector, Vector2(0,0))
		print_debug(transform.get_rotation())#rotation is in radians
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

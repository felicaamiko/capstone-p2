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
var clicked = false
var untilsixty = 0

func _ready():
	pass

#get mouse position vs get global mouse pos

#func _integrate_forces(state: PhysicsDirectBodyState2D):  #can go to sleep
	#print(get_viewport().get_mouse_position())
	#if (isHovered and clicked):
		#state.transform.origin = get_viewport().get_mouse_position()


func _physics_process(delta):
	clicked = Input.is_action_pressed("click")
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
	sqrtsenslastvector = Vector2(sqrt(abs(lastvector.x)) * horizdir, sqrt(abs(lastvector.y)) * vertdir) * sensitivity
	if (isHovered and Input.is_action_pressed("click")):#held down first frame
		apply_force(sqrtsenslastvector, Vector2(0,0))

func _on_area_2d_mouse_entered():
	#print_debug("entered")
	isHovered = true
	
	#apply_force(Vector2(0, 0), position)

func _on_area_2d_mouse_exited():
	#print_debug("exited")
	isHovered = false

extends KinematicBody

const SPEED = 4.5
const GRAVITY = -24.8
var target = null
var nav : Navigation = null
var vel = Vector3()


func _physics_process(delta):
	if target == null:
		return
	
	
	var path = get_path_to(target.global_transform.origin)
	
	if path.size() > 0:
		move_along_path(path)
		
func get_path_to(target):
	return nav.get_simple_path(global_transform.origin, target)
	
func move_along_path(path):
	if path.size() <= 0:
		return
	
	path.remove(0)
	
	var target = path[0]
	
	if global_transform.origin.distance_to(target)<0.1:
		path.remove(0)
		
	vel = (target - translation).normalized() * SPEED
	
	vel = move_and_slide(vel)
	
func set_target(target):
	self.target=target
	
func set_nav(nav):
	self.nav=nav
	

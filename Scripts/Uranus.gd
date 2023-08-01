extends CharacterBody3D

var angle : float = 800;
var radius : int = 3600;
var speed : float = Helper.baseSpeed * 9.4; 
var angular : float = Helper.orbitSpeed / 84;

func _process(delta: float):	
	speed = Helper.baseSpeed * 9.4
	angular = Helper.orbitSpeed / 84; 
	angle += delta;
	rotate_x(0.01 * speed); 
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);; 

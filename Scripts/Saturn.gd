extends CharacterBody3D

var angle : float = 600;
var radius : int = 1800;
var speed : float = Helper.baseSpeed * 23.4; 
var angular : float = Helper.orbitSpeed / 29;

func _process(delta: float):	
	speed = Helper.baseSpeed * 23.4;
	angular = Helper.orbitSpeed /29;
	angle += delta;
	rotate_y(0.01 * speed); 
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);


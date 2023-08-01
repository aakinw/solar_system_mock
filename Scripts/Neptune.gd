extends CharacterBody3D

var angle : float = 900;
var radius : int = 5472;
var speed : float = Helper.baseSpeed * 6.18; 
var angular : float = Helper.orbitSpeed / 165;

func _process(delta: float):	
	speed = Helper.baseSpeed * 6.18;
	angular = Helper.orbitSpeed / 165;
	angle += delta;
	rotate_y(0.01 * speed); 
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0); 

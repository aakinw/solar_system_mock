extends CharacterBody3D

var angle : float = 450;
var radius : int = 1000;
var speed : float = Helper.baseSpeed * 29; 
var angular : float = Helper.orbitSpeed / 12; 

func _process(delta: float):	
	speed = Helper.baseSpeed * 29;
	angular = Helper.orbitSpeed / 12; 
	angle += delta;
	rotate_y(0.01 * speed); 
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);


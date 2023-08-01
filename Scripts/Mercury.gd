extends CharacterBody3D

var angle : float = 0.0;
var radius : int = 530;
var speed : float = Helper.baseSpeed * 0.007; 
var angular: float = Helper.orbitSpeed * 4.14;

func _process(delta: float):
	speed = Helper.baseSpeed * 0.007;
	angular = Helper.orbitSpeed * 4.14; 	
	angle += delta;
	rotate_y(0.01 * speed); 
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);

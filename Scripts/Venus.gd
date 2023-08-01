extends CharacterBody3D

var angle : float = 50;
var radius : int = 575;
var speed : float = Helper.baseSpeed * 0.004;  
var angular: float = Helper.orbitSpeed * 1.62;

func _process(delta: float):	
	speed = Helper.baseSpeed * 0.004;
	angular = Helper.orbitSpeed * 1.62;
	angle += delta;
	rotate_y(-0.01 * speed); 
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);



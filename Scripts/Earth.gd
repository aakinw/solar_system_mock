extends CharacterBody3D

var angle : float = 150;
var radius : int = 610;
var speed : float = Helper.baseSpeed * 1;
var angular: float = Helper.orbitSpeed * 1;

func _process(delta: float):
	speed = Helper.baseSpeed * 1;
	angular = Helper.orbitSpeed * 1;
	angle += delta;
	rotate_y(0.01 * speed); 
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);



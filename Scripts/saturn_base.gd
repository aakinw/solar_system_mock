extends Node3D

var angle : float = 600;
var radius : int = 1800; 
var angular : float = Helper.orbitSpeed / 29;

func _process(delta: float):	
	angular = Helper.orbitSpeed / 29;
	angle += delta;
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);

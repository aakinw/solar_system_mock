extends Node3D

var angle : float = 450;
var radius : int = 1000;
var angular : float = Helper.orbitSpeed / 12; 

func _process(delta: float):	
	angular = Helper.orbitSpeed / 12;
	angle += delta;
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);

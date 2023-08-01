extends Node3D

var angle : float = 800;
var radius : int = 3600;
var angular : float = Helper.orbitSpeed / 84;

func _process(delta: float):	
	angular = Helper.orbitSpeed / 84;
	angle += delta;
	if Helper.planetOrbit == true:
		global_position = Vector3(cos(-angle * angular) * radius, 0, sin(-angle * angular) * radius) + Vector3(0, 0, 0);

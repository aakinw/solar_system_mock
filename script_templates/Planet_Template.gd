extends CharacterBody3D

var angle : float = 0.0;
var radius : int = 0;
var speed : float = 0.0;

func _process(delta: float):
	
	angle += delta;
	
	global_position = Vector3(sin(angle * speed) * radius, 0, cos(angle * speed) * radius) + Vector3(0,0,0);
	


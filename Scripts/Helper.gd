extends Node3D

@export var baseSpeed: float = 0.25; 
@export var orbitSpeed: float = 0.12;  
@export var planetOrbit : bool = true;
var orbit_visible : bool = true; 

#Planets
var orbits_path = preload("res://Support/Orbits.tscn");
var orbits = orbits_path.instantiate();

var sunCam : bool = false;
var mercuryCam : bool = false;
var venusCam : bool = false;
var earthCam: bool = false;
var marsCam : bool = false;
var jupiterCam : bool = false;
var saturnCam : bool = false; 
var uranusCam : bool = false;
var neptuneCam : bool = false; 

func preSet():
	add_child(orbits);

func showOrbit(controller: bool):
	if controller == true:
		add_child(orbits);
		orbit_visible = true;
	elif controller == false:
		remove_child(orbits);
		orbit_visible = false; 

func pauseOrbit():
	planetOrbit = false;
	
func resumeOrbit():
	planetOrbit = true;

func changeOrbitSpeed(numSpeed : float):
	orbitSpeed = numSpeed;
	
func changeRotateSpeed(rotateSpeed: float):
	baseSpeed = rotateSpeed; 

func cameraSignal(num : int):
	if num == 0:
		resetCam();
		sunCam = true;
	elif num == 1:
		resetCam();
		mercuryCam = true; 
	elif num == 2:
		resetCam();
		venusCam = true;
	elif num == 3:
		resetCam();
		earthCam = true;
	elif num == 4:
		resetCam();
		marsCam = true;
	elif num == 5:
		resetCam();
		jupiterCam = true;
	elif num == 6:
		resetCam();
		saturnCam = true;
	elif num == 7:
		resetCam();
		uranusCam = true;
	elif num == 8:
		resetCam();
		neptuneCam = true;

func getCam(num : int):
	if num == 0:
		return sunCam;
	elif num == 1:
		return mercuryCam;
	elif num == 2:
		return venusCam;
	elif num == 3:
		return earthCam;
	elif num == 4:
		return marsCam;
	elif num == 5:
		return jupiterCam;
	elif num == 6:
		return saturnCam;
	elif num == 7:
		return uranusCam;
	elif num == 8:
		return neptuneCam; 

func resetCam():
	sunCam = false;
	mercuryCam = false;
	venusCam = false;
	earthCam = false;
	marsCam = false;
	jupiterCam = false;
	saturnCam = false;
	uranusCam = false;
	neptuneCam = false; 

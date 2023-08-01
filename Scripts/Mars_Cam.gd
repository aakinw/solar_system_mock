extends Camera3D

#Node Paths
@export var camPath : NodePath;
@export var basePath: NodePath;
@onready var camera = get_node(camPath);
@onready var base = get_node(basePath);

#Zoom Settings
@export var min_zoom = 10;
@export var max_zoom = 3000;
@export var zoom_speed = 100;
@export var zoom_speed_damp= 0.5;

var num = 4;
 

var zoom_direction = 0;
func _ready():
	current = false;
	
func _process(delta: float):
	if current == true:
		zoom(delta);
	elif current == false:
		current = Helper.getCam(4);
	
func _unhandled_input(event: InputEvent) -> void:
	if current == true: 
		if event is InputEventMouseButton:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
		elif event.is_action_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			#Zoom Code
			if event.is_action_pressed("zoom_in"):
				zoom_direction = -1;
			if event.is_action_pressed("zoom_out"):
				zoom_direction = 1;
			if event is InputEventMouseMotion:
				base.rotate_y(-event.relative.x * 0.01);
				
func zoom(delta: float):
	var newZoom = clamp(camera.position.x + zoom_speed * delta * zoom_direction, min_zoom, max_zoom);
	camera.position.x = newZoom;
	#Makes movement natural
	zoom_direction *= zoom_speed_damp;
	if abs(zoom_direction) <= 0.0001:
		zoom_direction = 0;

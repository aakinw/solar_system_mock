extends CharacterBody3D

const SPEED: float = 100.0;
const VERT_SPEED: float = 0.5;
const JUMP_VELOCITY = 4.5;
var vel = Vector3.ZERO;

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity");
@onready var base := $Base;
@onready var camera := $Base/User_Cam;

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			base.rotate_y(-event.relative.x * 0.01);
			camera.rotate_x(-event.relative.y * 0.01);
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90));
	
	
func _physics_process(_delta: float) -> void:
	
	var input_dir := Input.get_vector("left", "right", "forward", "back");
	var direction = (base.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized();
	
#	Down Movement
	if Input.is_action_pressed("up"):
		vel.y += VERT_SPEED;	
	elif Input.is_action_just_released("up"):
		vel.y = 0;
#	Up Movement
	if Input.is_action_pressed("down"):
		vel.y -= VERT_SPEED;	
	elif Input.is_action_just_released("down"):
		vel.y = 0;
		
#	Left/Right Movement
	if direction:
		vel.x = direction.x * SPEED;
		vel.z = direction.z * SPEED;
	else:
		vel.x = move_toward(vel.x, 0, SPEED);
		vel.z = move_toward(vel.z, 0, SPEED);
		
	set_velocity(vel)
	move_and_slide()
	vel = vel;
	

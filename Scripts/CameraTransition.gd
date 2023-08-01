extends Node

@onready var camera3D: Camera3D = $Camera3D
@onready var tween: Tween = get_tree().create_tween();
var transitioning: bool = false

func _ready() -> void:
	camera3D.current = false

func transition_camera3D(from: Camera3D, to: Camera3D, duration: float = 1.0) -> void:
	if transitioning: return
	# Copy the parameters of the first camera
	camera3D.fov = from.fov
	camera3D.cull_mask = from.cull_mask
	
	# Move our transition camera to the first camera position
	camera3D.global_transform = from.global_transform
	
	# Make our transition camera current
	camera3D.current = true
	
	transitioning = true
	
	tween.set_parallel(true)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(camera3D, "global_transform", to.global_transform, duration).from(camera3D.global_transform)
	tween.tween_property(camera3D, "fov", to.fov, duration).from(camera3D.fov)

	# Wait for the tween to complete
	await tween.finished
	
	# Make the second camera current
	to.current = true
	transitioning = false

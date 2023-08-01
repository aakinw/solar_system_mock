extends Button

@onready var confirm = $StartConfirm;

func _pressed():
	confirm.play();
	await confirm.finished;
	get_tree().change_scene_to_file("res://Scenes/Diagram.tscn");
	
	

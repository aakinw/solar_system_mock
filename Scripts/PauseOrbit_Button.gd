extends CheckButton


func _pressed():
	if is_pressed() == true:
		Helper.resumeOrbit();
	elif is_pressed() == false:
		Helper.pauseOrbit();


func _on_reset_button_pressed():
	button_pressed = false;
	Helper.resumeOrbit();

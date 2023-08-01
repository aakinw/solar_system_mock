extends CheckButton


func _pressed():
	if is_pressed() == true:
		Helper.showOrbit(true);
	elif is_pressed() == false:
		Helper.showOrbit(false);
	



func _on_reset_button_pressed():
	button_pressed = true;
	Helper.showOrbit(true);

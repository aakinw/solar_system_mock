extends LineEdit


func _on_text_submitted(new_text):
	var num = float(new_text);
	if num > 2.0:
		clear();
		insert_text_at_caret("2.0");
		Helper.changeOrbitSpeed(2.0);
	elif num < 0:
		clear();
		insert_text_at_caret("0");
		Helper.changeOrbitSpeed(0);
	else:
		Helper.changeOrbitSpeed(num);
	release_focus();


func _on_reset_button_pressed():
	clear();
	text = "0.12";
	Helper.changeOrbitSpeed(0.12);

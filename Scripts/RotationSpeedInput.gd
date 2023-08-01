extends LineEdit


func _on_text_submitted(new_text):
	var num = float(new_text);
	if num > 1.0:
		clear();
		insert_text_at_caret("1.0");
		Helper.changeRotateSpeed(1.0);
	elif num < 0:
		clear();
		insert_text_at_caret("0");
		Helper.changeRotateSpeed(0);
	else:
		Helper.changeRotateSpeed(num);
	release_focus();


func _on_reset_button_pressed():
	clear();
	text = "0.25";
	Helper.changeRotateSpeed(0.25);

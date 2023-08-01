extends Control
var menu_open : bool = false;


func _ready():
	get_node('.').hide()
	
func _unhandled_input(event):
	var controller = get_node('/root/Diagram');
	var animation = get_node('Panel_Anim');
	if event.is_action_pressed("planet_menu") && menu_open == false:
		if controller.other_menu == false:
			get_node('.').show()
			animation.play("Panel_Slide");
			menu_open = true;
			controller.other_menu = true;
			mouseMode();
	elif event.is_action_pressed("planet_menu") && menu_open == true:
		animation.play("Panel_Rev");
		await animation.animation_finished;
		get_node('.').hide();
		menu_open = false;
		controller.other_menu = false;
		mouseMode();


func mouseMode():
	if menu_open == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	elif menu_open == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);

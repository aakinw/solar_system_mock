extends Label

@export var speed = 5;
@export var fade = false; 

var time = 0;
var sTime = 0;
var isVisible = false;


#Function that flashes the text
func flash():
	if !fade:
		if sTime > 0:
			isVisible = true;
			
		else:
			isVisible = false;
	else:
		isVisible = true;
		modulate.a = sTime;
		

#Delta time function
func _physics_process(delta):
	time += delta;
	sTime = sin(time * speed); 
	flash();

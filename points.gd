extends Panel
var Points = 0

var self_teacher_points = [0,0,0]
var teachers_points = []

var max_elements = 3


func _process(delta: float) -> void:
	var i = 0
	
	for a in range(3):
		for b in range (max_elements):
			if get_node("Panel/Option"+str(a+1)+"/"+str(b+1)).button_pressed:
				i += [1,5,10][a]
	

	Points = i
	$PointCount.text = str(int(round(Points/30.0 * 100))) + "/100 puntos totales"


func save_point_data(idx):
	self_teacher_points.resize(max_elements)
	for a in range(3):
		for b in range (max_elements):
			if get_node("Panel/Option"+str(a+1)+"/"+str(b+1)).button_pressed:
				self_teacher_points[b] = a

func load_points_data(idx):
	self_teacher_points = teachers_points.duplicate()[idx]
	self_teacher_points.resize(max_elements)
	for a in range(3):
		for b in range (max_elements):
			get_node("Panel/Option"+str(a+1)+"/"+str(b+1)).button_pressed = self_teacher_points[b] == a

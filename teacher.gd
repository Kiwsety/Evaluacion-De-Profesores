extends Panel

@onready var POINTS = $"../Points"

var teachers = []
var selected_idx = -1

@onready var Name = $Name
@onready var Year = $Year
@onready var Selector = $"Teacher Selector"
@onready var Add = $Add


func teacher_selected(index: int) -> void:
	selected_idx = index
	if selected_idx != -1:
		separate_name(teachers[index])
		POINTS.load_points_data(index)

func separate_name(text:String):
	if selected_idx != -1:
		var tname = text.split("¿")[0]
		var tyear = text.split("¿")[1]
		
		Name.text = tname
		Year.text = tyear

func set_teachers():
	Selector.clear()
	POINTS.teachers_points.resize(teachers.size())
	if teachers.size() > 0:
		for i in range(teachers.size()):
			Selector.add_item(teachers[i].replace("¿"," - "))
		Selector.select(selected_idx)
	else:
		Selector.select(-1)

func save_teacher():
	if selected_idx != -1:
		teachers[selected_idx] = Name.text + "¿" + Year.text


func guardar() -> void:
	if selected_idx != -1:
		POINTS.save_point_data(selected_idx)
		POINTS.teachers_points[selected_idx] = POINTS.self_teacher_points.duplicate()
		save_teacher()
		set_teachers()
	get_parent().save_computer()


func agregar() -> void:
	selected_idx = teachers.size()
	teachers.append("")
	POINTS.teachers_points.append([0,0,0])
	guardar()

func eliminar():
	teachers.remove_at(selected_idx)
	POINTS.teachers_points.remove_at(selected_idx)
	selected_idx = -1
	save_teacher()
	set_teachers()

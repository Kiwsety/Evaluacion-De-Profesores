extends Panel

var teachers:Array[String] = ["Maria Vazquez¿5°2","Profesor¿6°5"]
var selected_idx = 0

@onready var Name = $Name
@onready var Year = $Year
@onready var Selector = $"Teacher Selector"
@onready var Add = $Add


func _ready() -> void:
	teacher_selected(0)
	set_teachers()


func _process(delta: float) -> void:
	pass

func teacher_selected(index: int) -> void:
	selected_idx = index
	separate_name(teachers[index])

func separate_name(text:String):
	var tname = text.split("¿")[0]
	var tyear = text.split("¿")[1]
	
	Name.text = tname
	Year.text = tyear

func set_teachers():
	Selector.clear()
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
	save_teacher()
	set_teachers()


func agregar() -> void:
	selected_idx = teachers.size()
	teachers.append("")
	save_teacher()
	set_teachers()

func eliminar():
	teachers.remove_at(selected_idx)
	selected_idx = -1
	save_teacher()
	set_teachers()

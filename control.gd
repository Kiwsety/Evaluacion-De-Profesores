extends Control

@onready var TEACHERS = $Teacher
@onready var POINTS = $Points

@onready var http_request = $HTTPRequest

func _ready() -> void:
	load_computer()
	TEACHERS.teacher_selected(-1)
	TEACHERS.set_teachers()

func save_computer():
	var data = [TEACHERS.teachers,POINTS.teachers_points]
	var file = FileAccess.open("user://save.txt",FileAccess.WRITE)
	file.store_var(data)

func load_computer():
	var file = FileAccess.open("user://save.txt",FileAccess.READ)
	if file != null:
		var data = file.get_var()
		TEACHERS.teachers = data.duplicate()[0]
		POINTS.teachers_points = data.duplicate()[1]

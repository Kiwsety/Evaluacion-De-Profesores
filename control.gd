extends Control

@onready var boton = $Button

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func funcion():
	if false or true:
		boton.position = Vector2(randi_range(0,300),randi_range(0,500))

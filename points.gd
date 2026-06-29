extends Panel
var Points = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var i = 0
	
	#1
	if $"Panel/Option1/1".button_pressed:
		i+=1
	elif $"Panel/Option2/1".button_pressed:
		i+=5
	elif $"Panel/Option3/1".button_pressed:
		i+=10
	
	#2
	if $"Panel/Option1/2".button_pressed:
		i+=1
	elif $"Panel/Option2/2".button_pressed:
		i+=5
	elif $"Panel/Option3/2".button_pressed:
		i+=10
	Points = i
	$PointCount.text = str(Points)
	
	#3
	if $"Panel/Option1/3".button_pressed:
		i+=1
	elif $"Panel/Option2/3".button_pressed:
		i+=5
	elif $"Panel/Option3/3".button_pressed:
		i+=10
	Points = i
	$PointCount.text = str(int(round(Points/30.0 * 100))) + "%"

extends Node
@onready var point_label: Label = %PointLabel

var point = 0

func add_point():
	point += 1
	point_label.text = "Point: %s"  %point
	print(point)

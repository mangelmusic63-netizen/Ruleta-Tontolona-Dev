extends Node2D

export(Array, String) var slices = [
	"Haz 10 sentadillas",
	"Cuenta un chiste",
	"Baila 20 segundos",
	"Pierdes un turno",
	"Imita un animal",
	"Elige a otro jugador",
	"Canta una canción",
	"Cambio de lugar"
]

var angle_offset := 0.0 setget set_angle_offset
var colors := [
	Color("#f94144"),
	Color("#f3722c"),
	Color("#f8961e"),
	Color("#f9c74f"),
	Color("#90be6d"),
	Color("#43aa8b"),
	Color("#577590"),
	Color("#277da1")
]

func set_angle_offset(value: float) -> void:
	angle_offset = value
	update()

func _draw() -> void:
	if slices.empty():
		return

	var center := Vector2.ZERO
	var radius := 230.0
	var slice_angle := TAU / float(slices.size())

	for i in range(slices.size()):
		var start_angle := angle_offset + (i * slice_angle)
		var end_angle := start_angle + slice_angle
		_draw_sector(center, radius, start_angle, end_angle, colors[i % colors.size()])

	draw_circle(center, 10.0, Color.white)

func _draw_sector(center: Vector2, radius: float, start_angle: float, end_angle: float, color: Color) -> void:
	var points := PoolVector2Array()
	points.append(center)

	var steps := 28
	for step in range(steps + 1):
		var t := lerp(start_angle, end_angle, float(step) / float(steps))
		points.append(center + Vector2(cos(t), sin(t)) * radius)

	draw_colored_polygon(points, color)

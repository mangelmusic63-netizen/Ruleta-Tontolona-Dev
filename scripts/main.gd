extends Control

onready var wheel := $Wheel
onready var result_label := $ResultLabel
onready var spin_button := $SpinButton
onready var challenge_label := $ChallengeLabel

var spinning := false
var wheel_angle := 0.0
var angular_velocity := 0.0
var friction := 5.4

func _ready() -> void:
	randomize()
	_update_selected_challenge()

func _process(delta: float) -> void:
	if not spinning:
		return

	wheel_angle += angular_velocity * delta
	angular_velocity = max(angular_velocity - friction * delta, 0.0)
	wheel.set_angle_offset(wheel_angle)

	if angular_velocity <= 0.0:
		spinning = false
		spin_button.disabled = false
		var selected := _get_selected_index()
		result_label.text = "¡Te tocó!"
		challenge_label.text = wheel.slices[selected]

func _on_SpinButton_pressed() -> void:
	if spinning:
		return

	spinning = true
	spin_button.disabled = true
	angular_velocity = rand_range(20.0, 30.0)
	result_label.text = "Girando..."
	challenge_label.text = ""

func _get_selected_index() -> int:
	var total := wheel.slices.size()
	if total == 0:
		return 0

	var slice_angle := TAU / float(total)
	var pointer_angle := -PI / 2.0
	var normalized := fposmod(pointer_angle - wheel_angle, TAU)
	return int(floor(normalized / slice_angle)) % total

func _update_selected_challenge() -> void:
	var selected := _get_selected_index()
	if wheel.slices.size() > 0:
		challenge_label.text = wheel.slices[selected]

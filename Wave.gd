extends AnimatableBody2D

func _ready():
	Global.hihat.connect(_on_beat)

@export var move_rate: float = 600 
func _on_beat() -> void:
	position.x += move_rate / Global.bpm

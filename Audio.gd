extends Node

@export var snare :AudioStreamPlayer
@export var kick: AudioStreamPlayer
@export var hihat: AudioStreamPlayer

func _ready():
	Global.snare.connect(_play_snare)
	Global.kick.connect(_play_kick)
	Global.hihat.connect(_play_hihat)

func _play_snare() -> void:
	snare.play()

func _play_hihat() -> void:
	hihat.play()

func _play_kick() -> void:
	kick.play()

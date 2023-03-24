extends Node

enum note_types {NOTE, HIHAT, KICK, SNARE}

var bpm: int = 120
var fpb: int
var frames: int = 0

signal beat
signal half_beat

signal kick
signal snare
signal hihat
signal note

func _physics_process(delta):
	fpb = int(60.0 / (delta * bpm))
	frames += 1
	if fmod(frames, fpb / 2) == 0:
		emit_signal("half_beat") 
	if fmod(frames, fpb) == 0:
		emit_signal("beat") 
		frames = 0

extends Node2D

var note_scene = preload("res://note.tscn")

@export var kick_pos: Marker2D
@export var snare_pos: Marker2D
@export var hihat_pos: Marker2D
@export var low_note_pos: Marker2D
@export var high_note_pos: Marker2D

var note_pos_dict : Dictionary

func _ready():
	note_pos_dict = {
	Global.note_types.KICK: kick_pos.position,
	Global.note_types.SNARE: snare_pos.position,
	Global.note_types.HIHAT: hihat_pos.position,
	Global.note_types.NOTE: low_note_pos.position
	}
	
	Global.beat.connect(_on_beat)
	Global.half_beat.connect(_on_half_beat)
	

func create_note(type: Global.note_types) -> void:
	var new_note = note_scene.instantiate()
	new_note.type = type
	new_note.position = note_pos_dict[new_note.type]
	add_child(new_note)
	
func _on_half_beat() -> void:
	create_note(Global.note_types.HIHAT)
	
	
var beat_count: int = 0
func _on_beat() -> void:
	
	if beat_count % 4 == 0:
		create_note(Global.note_types.KICK)
	if (beat_count - 2) % 4 == 0:
		create_note(Global.note_types.SNARE)
	beat_count += 1

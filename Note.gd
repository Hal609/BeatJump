extends Node2D

@export var circle_sprite: Sprite2D
@export var pentagon_sprite: Sprite2D
@export var square_sprite: Sprite2D
@export var triangle_sprite: Sprite2D


@export var type := Global.note_types.KICK

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	circle_sprite.set_visible(false)
	pentagon_sprite.set_visible(false)
	square_sprite.set_visible(false)
	triangle_sprite.set_visible(false)
	
	match type:
		Global.note_types.NOTE:
			circle_sprite.set_visible(true)
		Global.note_types.HIHAT:
			pentagon_sprite.set_visible(true)
		Global.note_types.KICK:
			square_sprite.set_visible(true)
		Global.note_types.SNARE:
			triangle_sprite.set_visible(true)


var speed: float = 600
func _physics_process(delta) -> void:
	position.x -= speed * delta


func _on_area_2d_body_entered(body):
	if body.get_name() == "NoteDestination":
		match type:
			Global.note_types.NOTE:
				Global.emit_signal("note")
			Global.note_types.HIHAT:
				Global.emit_signal("hihat")
			Global.note_types.KICK:
				Global.emit_signal("kick")
			Global.note_types.SNARE:
				Global.emit_signal("snare")
		queue_free()

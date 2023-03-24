extends AnimatableBody2D

enum Direction {UP, DOWN, LEFT, RIGHT, NEUTRAL}
@export var direction: Direction

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.snare.connect(_activate)

func _activate():
	$CollisionPolygon2D.set_deferred("disabled", false)
	var tween = get_tree().create_tween()
	match direction:
		Direction.DOWN:
			tween.tween_property(self, "position:y", (position.y + 52), 0.1)
		Direction.UP:
			tween.tween_property(self, "position:y", (position.y - 52), 0.1)
	$Timer.start()
	
func _deactivate():
	$CollisionPolygon2D.set_deferred("disabled", true)
	var tween = get_tree().create_tween()
	match direction:
		Direction.DOWN:
			tween.tween_property(self, "position:y", (position.y - 52), 0.1)
		Direction.UP:
			tween.tween_property(self, "position:y", (position.y + 52), 0.1)

func _on_timer_timeout():
	_deactivate()

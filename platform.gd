extends AnimatableBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.note.connect(_activate)
	_deactivate()

func _deactivate():
	$CollisionShape2D.set_deferred("disabled", true)
	$PlatformSpace.visible = true
	$PlatformFull.visible = false

func _activate():
	$CollisionShape2D.set_deferred("disabled", false)
	$PlatformRing.visible = false
	$PlatformSpace.visible = false
	$PlatformFull.visible = true
	
func _physics_process(_delta):
	pass

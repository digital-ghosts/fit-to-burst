extends Sprite2D

var time = 0
var animated = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if animated:
		self.rotate(.001)
		self.scale = self.scale + (Vector2(sin(time), sin(time)) * .001 )
		time += .05

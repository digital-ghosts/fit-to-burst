extends Sprite2D

var growth_rate = 1.001

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Starburst.is_dead:
		growth_rate = (.0001 * delta) + growth_rate
		self.scale = self.scale * growth_rate
	else:
		growth_rate = 1.001
		self.scale = self.scale
	
func pop() -> void:
	queue_free()

func _on_burst_area_body_entered(body: Node2D) -> void:
	if !Starburst.is_dead:
		pop()

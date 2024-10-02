extends Timer

var rate = .0005

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.wait_time = self.wait_time - (rate * self.wait_time)
	if Starburst.is_dead:
		self.stop()
		self.wait_time = .8
		rate = .0005
		

func _on_root_story_ended() -> void:
	rate = .001

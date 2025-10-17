extends Area2D

var acceleration = 1.0
var velocity = 0.0
var rotation_velocity = randf_range(1.0,3.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity += acceleration * delta
	position.y += velocity
	rotation += rotation_velocity * delta

# when something enters the duck
func _on_body_entered(body):
	if body.name == "Player": # if the entered node is named "Player"
		GlobalScript.emit_signal("collected") # emit signal to Global
		queue_free() # delete this instance of the duck

extends Area2D

var acceleration = 1.0 # acceleration
var velocity = 0.0 # velocity
var rotation_velocity = randf_range(1.0,3.0) # rotational velociy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity += acceleration * delta # calculate velocity
	position.y += velocity # change y position using velocity value
	rotation += rotation_velocity * delta # give rotational velocity

# when something enters the duck
func _on_body_entered(body):
	if body.name == "Player": # if the entered node is named "Player"
		GlobalScript.emit_signal("collected") # emit signal to Global
		queue_free() # delete this instance of the duck

extends Node2D

@onready var duck_prefab = preload("res://duck.tscn") # preload duck scene
@onready var score = 0 # reset score to 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# update score label
	$UI/Label.text = "Score: " + str(score)
	# connect signal
	GlobalScript.connect("collected", Callable(self, "_on_duck_collected"))

func _on_duck_spawn_timer_timeout() -> void:
	#spawn a duck
	randomize()
	var duck = duck_prefab.instantiate() # spawn duck
	duck.position = Vector2(randi_range(10,1024), -50) # change duck position randomly
	duck.rotation = randf_range(0,2*PI) # give rotation
	add_child(duck) # add duck as a child

# when signal recieved
func _on_duck_collected():
	score += 1 # add 1 to score
	$UI/Label.text = "Score: " + str(score) # update score UI

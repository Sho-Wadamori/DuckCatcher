extends CharacterBody2D
class_name Player # give node class name of "Player"

@onready var screen_size = get_viewport_rect().size # get screen size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	movement()

func movement():
	screen_size = get_viewport_rect().size # get screen size
	if Input.is_action_pressed("up") and position.y > 0: # move player up if more than y=0
		position.y -= 10
	if Input.is_action_pressed("down") and position.y < screen_size.y: # move player down if less than y=screenheight
		position.y += 10
	if Input.is_action_pressed("right") and position.x < screen_size.x: # move player right if less than x=screenwidth
		position.x += 10
	if Input.is_action_pressed("left") and position.x > 0: # move player left if more than x=0
		position.x -= 10

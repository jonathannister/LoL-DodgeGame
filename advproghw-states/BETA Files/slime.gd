class_name Slime extends Enemy

enum State {SITTING, JUMP_LEFT, JUMP_UP, JUMP_RIGHT, JUMP_DOWN, DYING, DEAD}
const JUMP_STATES = [State.JUMP_DOWN, State.JUMP_LEFT, State.JUMP_RIGHT, State.JUMP_UP]

const JUMP_VECTORS = {
	State.JUMP_UP: [Vector2.ZERO, Vector2.ZERO, Vector2(0, -75), Vector2(0, -75), Vector2(0, -75), Vector2.ZERO, Vector2.ZERO],
	State.JUMP_DOWN: [Vector2.ZERO, Vector2.ZERO, Vector2(0, 75), Vector2(0, 75), Vector2(0, 75), Vector2.ZERO, Vector2.ZERO],
	State.JUMP_LEFT: [Vector2.ZERO, Vector2.ZERO, Vector2(-75, 0), Vector2(-100, 0), Vector2(-75, 0), Vector2.ZERO, Vector2.ZERO],
	State.JUMP_RIGHT: [Vector2.ZERO, Vector2.ZERO, Vector2(75, 0), Vector2(100, 0), Vector2(75, 0), Vector2.ZERO, Vector2.ZERO],
}

var curstate = State.SITTING
var state_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	switch_to(State.SITTING)

# Called when you switch to a new state
# Handles starting the proper animation, reseting the timers and
# removing yourself once dead
func switch_to(new_state: State):
	pass

func _physics_process(delta):
	# Update the amount of time you spent in the current state
	state_time += delta
	
	# After some time, just jump in a random direction by switching to a random jump state
	# TODO
		
	# If you are in a jump state, then you want to set a movement vector
	# We set a movement vector for each frame of the animation, as defined at the top of the file
	# TODO
		
# This will be called by the game if this Slime is hit with a weapon
func hit():
	switch_to(State.DYING)

# This is a signal that will trigger when an animation finishes
# We will then transition to a new state
func _on_animated_sprite_2d_animation_finished():
	if curstate in JUMP_STATES:
		# TODO
		pass
	elif curstate == State.DYING:
		# TODO
		pass

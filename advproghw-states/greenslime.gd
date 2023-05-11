extends Slime 



# Called when the node enters the scene tree for the first time.
func _ready():
	switch_to(State.SITTING)

# Called when you switch to a new state
# Handles starting the proper animation, reseting the timers and
# removing yourself once dead

func _physics_process(delta):
	# Update the amount of time you spent in the current state
	state_time += delta

	var player = get_tree().get_root().find_child("Player",true,false)
	var dir = player.position -self.position
	var ang = rad_to_deg(dir.angle())
	if curstate == State.SITTING and state_time> 2.0:
		if ang >-45 and ang <=45:
			switch_to(State.JUMP_LEFT)
		elif ang>45 and ang <=135:
			switch_to(State.JUMP_UP)
		elif ang<-45 and ang >=-135:
			switch_to(State.JUMP_DOWN)
		else:
			switch_to(State.JUMP_RIGHT)
	if curstate in JUMP_STATES:
		move_and_collide(JUMP_VECTORS[curstate][$AnimatedSprite2D.frame] * delta)

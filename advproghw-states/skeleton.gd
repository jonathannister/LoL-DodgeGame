class_name Skeleton extends Enemy

enum State {LEFT, RIGHT, DYING, DEAD, REVIVE}


var curstate = State.LEFT
var state_time = 0.0
var speed = 1.5
var tot_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	switch_to(State.LEFT)

# Called when you switch to a new state
# Handles starting the proper animation, reseting the timers and
# removing yourself once dead
func switch_to(new_state: State):
	# Prevent invalid transitions, once you start dying, you can't go back to jumping
	if curstate == State.DYING and new_state != State.DEAD:
		return
		
	curstate = new_state
	state_time = 0.0
	
	if new_state == State.LEFT:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = true
	elif new_state == State.RIGHT:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = false
	elif new_state == State.DYING:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.play("death")
	elif new_state == State.REVIVE:
		$AnimatedSprite2D.frame = 0 
		$AnimatedSprite2D.play_backwards("death")
	elif new_state == State.DEAD:
		print("Dead")
		var player = get_tree().get_root().find_child("Player",true,false)
		player.score += 5
		pass 

func _physics_process(delta):
	tot_time += delta
	speed = 2 + tot_time / 100
	# Update the amount of time you spent in the current state
	state_time += delta
	var player = get_tree().get_root().find_child("Player",true,false)
	var dir = (player.position -self.position).normalized()
	var ang = rad_to_deg(dir.angle())
	if curstate == State.LEFT || curstate == State.RIGHT:
		if ang >-90 and ang <=90:
			if curstate == State.RIGHT: switch_to(State.LEFT)
		elif curstate == State.LEFT: switch_to(State.RIGHT)
	
		var collide = move_and_collide(dir * speed)	
		if collide && curstate == State.LEFT:
			switch_to(State.RIGHT)
		elif collide && curstate == State.RIGHT:
			switch_to(State.LEFT)
	elif curstate == State.DEAD && state_time >= 5.0:
		switch_to(State.REVIVE)
		print("Reviving")
	elif curstate == State.REVIVE && state_time > 1.0:
		switch_to(State.LEFT)
	elif curstate == State.DYING && state_time > 0.5: 
		switch_to(State.DEAD)
	
# This will be called by the game if this Slime is hit with a weapon
func hit():
	switch_to(State.DYING)

# This is a signal that will trigger when an animation finishes
# We will then transition to a new state
func _on_animated_sprite_2d_animation_finished():
	if curstate == State.DYING:
		switch_to(State.DEAD)
	if curstate == State.REVIVE: 
		switch_to(State.LEFT)

func _on_area_2d_body_entered(body):
	if curstate != State.DEAD: switch_to(State.DYING)

extends CharacterBody2D

const SPEED = 5
var loc
var dir

func _ready():
	dir = Vector2(randf_range(-1000, 1000), randf_range(-1000, 1000)).normalized()

	#var distVec = dir
	#var theta = atan2(distVec.y, distVec.x)
	#$AnimatedSprite2D.rotation = theta
	var theta = atan2(dir.y, dir.x)
	$AnimatedSprite2D.rotation = theta - 90
	
	$AnimatedSprite2D.frame = 0 
	$AnimatedSprite2D.play("Burn")

func _physics_process(delta):
	var collide = move_and_collide(dir * SPEED)	

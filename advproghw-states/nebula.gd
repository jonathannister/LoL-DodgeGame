extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.frame = 0 
	$AnimatedSprite2D.play("Spin")

func _physics_process(delta):
	pass

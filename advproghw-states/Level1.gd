extends Node2D

var skeleton_scene = preload("res://skeleton.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= 5.0: 
		timer = 0
		var skeleton1 = skeleton_scene.instantiate()
		var skeleton2 = skeleton_scene.instantiate()
		skeleton1.position = Vector2(randf_range(0, 100), randf_range(0, 600))
		skeleton2.position = Vector2(randf_range(1000, 1200), randf_range(0, 600))
		add_child(skeleton1)
		add_child(skeleton2)


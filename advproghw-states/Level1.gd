extends Node2D

var skeleton_scene = preload("res://skeleton.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var skeleton = skeleton_scene.instantiate()
	add_child(skeleton)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


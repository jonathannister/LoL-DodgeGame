extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_tree().get_root().find_child("Player",true,false)
	$Label.text = "You Lose. Score: " + str(int(player.score))


func _on_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")

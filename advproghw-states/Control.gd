extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_tree().get_root().find_child("Player",true,false)
	var lost = player.lost 
	if !lost: 
		$Label.text = "Score: " + str(int(player.score))
	else: 
		$Label.text = "You Lose."
	

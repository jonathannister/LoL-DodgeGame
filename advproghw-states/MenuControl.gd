extends Control

func _ready(): 
	$VBoxContainer/startButton.grab_focus()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Level1.tscn")


func _on_desc_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()

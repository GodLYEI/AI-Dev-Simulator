extends CanvasLayer

@export var Questions : Control
@export var Player : CharacterBody2D

var ethic_values_pressing_yes = [-10, -15, -10, -15, -10, -10]
var ethic_values_pressing_no = [10, 15, 10, 10, 15, 10]

var cur_question = 0;

func update_visibility(id, value):
	Questions.get_child(id).visible = value

func is_vaild_question(id):
	return id < Questions.get_child_count()

func on_button_pressed():

	update_visibility(cur_question, false);

	cur_question += 1
	if (not is_vaild_question(cur_question)): return

	update_visibility(cur_question, true);


func _on_no_button_pressed() -> void:
	if (not is_vaild_question(cur_question)): return
	Player.modify_ethic(ethic_values_pressing_no[cur_question])
	on_button_pressed()


func _on_yes_button_pressed() -> void:
	if (not is_vaild_question(cur_question)): return
	Player.modify_ethic(ethic_values_pressing_yes[cur_question])
	on_button_pressed()

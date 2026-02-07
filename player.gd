extends CharacterBody2D

@export var speed: float = 100.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	# -------- INPUT --------
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	# -------- DI CHUYỂN --------
	velocity = input_vector.normalized() * speed
	move_and_slide()  # Godot 4, tự dùng velocity đã set

	# -------- ANIMATION --------
	if input_vector == Vector2.ZERO:
		# idle
		if anim.animation.begins_with("walk"):
			var idle_anim = anim.animation.replace("walk", "idle")
			anim.play(idle_anim, true)  # reset frame ngay lập tức
	else:
		# walk animation
		var walk_anim: String
		if abs(input_vector.x) > abs(input_vector.y):
			walk_anim = "walk_right"
			anim.flip_h = input_vector.x < 0
		else:
			walk_anim = "walk_front" if input_vector.y > 0 else "walk_back"
		anim.play(walk_anim, true)  # reset frame để tránh nhảy frame

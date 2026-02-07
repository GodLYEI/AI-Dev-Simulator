extends CanvasLayer

func _ready():
	play(100, 1)

func play(ethics_scale, type):
	$Ethics.start_text(ethics_scale)
	$Endings.start_text(type)
	$EthicsMessage.start_text(type)
	# if (ethic_scale >= 50):
	# 	if (ethic_scale < 170): high()
	# 	else: highest()
	# else:
	# 	if (ethic_scale < -45): lowest()
	# 	else: low()	
	# pass

extends Area2D



func _on_JumpPad_body_entered(body):
	$AnimationPlayer.play("boost") # Replace with function body.
	body.boost()

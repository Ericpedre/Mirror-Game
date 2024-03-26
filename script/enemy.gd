extends CharacterBody3D


const SPEED = 70
const JUMP_VELOCITY = 4.5

var player_in_area = false
var player

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	if player_in_area:
		position += (player.position - position) / SPEED

	move_and_slide()

func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		player = body

func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false

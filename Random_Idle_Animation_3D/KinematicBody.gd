extends KinematicBody

onready var animationPlayer = $AnimationPlayer

func _ready():
	randomize()
	animationPlayer.play("idle-loop")
	$RandTimer.start()


func _physics_process(delta):
	if $RandTimer.is_stopped():
		if animationPlayer.current_animation == "idle-loop":
			play_random_animation(animationPlayer)
		
		
func play_random_animation(animationPlayer):
	var animation_list = animationPlayer.get_animation_list()
	var random_animation = animation_list[randi() % animation_list.size()]
	animationPlayer.play(random_animation)


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Resta" or "Restb":
		print("Rest")
		animationPlayer.play("idle-loop")
		$RandTimer.start()

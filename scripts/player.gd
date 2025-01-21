extends CharacterBody2D

var speed = 1000
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = $"RocketContainer"

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2(0, 0)
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	move_and_slide()
	
	var screen_size = get_viewport_rect().size

	global_position = global_position.clamp(Vector2(0,0), screen_size)


func shoot():
	# Make the instance of the rocket
	var rocket_instance = rocket_scene.instantiate()
	add_sibling(rocket_instance)
	rocket_instance.position = self.position
	rocket_instance.position.x += 75
	
	#rocket_container.add_child(rocket_instance)
	#
	## Set the position of the instance
	#rocket_instance.global_position = global_position
	#rocket_instance.global_position.x += 75

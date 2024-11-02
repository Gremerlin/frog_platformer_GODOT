extends CharacterBody2D


@export var SPEED = 400.0
@export var JUMP_VELOCITY = -900.0
@onready var frog_sprite = $frog_sprite
#@onready var collision:= $collision
#var collision_rid 
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#collision_rid= collision.get_collider_rid()
	#print(str(collision_rid))
	pass


func _physics_process(delta):
	if (velocity.x>1||velocity.x<-1):
		frog_sprite.animation = 'running'
	else:
		frog_sprite.animation = 'idle'
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		frog_sprite.animation = 'jumping'
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and !Input.is_action_pressed("down"):
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if velocity.x < 0:
		frog_sprite.flip_h = true
	if velocity.x >0:
		frog_sprite.flip_h = false
		
	if Input.is_action_pressed('down') and Input.is_action_pressed('jump'):
		position.y += 1
			





















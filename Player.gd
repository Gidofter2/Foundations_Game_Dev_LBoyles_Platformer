extends KinematicBody2D

const GRAVITY = 950
const MAX_SPEED = 1000
const ACCEL = 600
const FRICTION = 13000
const JUMP = 600

onready var anim = $AnimatedSprite
var velocity = Vector2.ZERO
var can_move = true



# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#GRAVITY
	if Input.is_action_pressed("ui_right"):
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL * delta)
		anim.play("walk")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL * delta)
		anim.play("walk")
		anim.flip_h = true
	
		
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		anim.play("idle")
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP
	if Input.is_action_just_pressed("ui_down"):
		velocity.y = JUMP
	
	if not is_on_floor():
		anim.play("jump")
		
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if can_move:
		velocity = move_and_slide(velocity, Vector2.UP)
	
func bounce():
	velocity.y = 0.5 * JUMP
	


func _on_WinPlane_body_entered(body):
	can_move = false

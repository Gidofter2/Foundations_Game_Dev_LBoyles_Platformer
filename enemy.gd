extends KinematicBody2D
const GRAVITY = 950

var velocity = Vector2.ZERO
var speed = 50
export var direction = -1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()
	#$FloorDetector.position.x = $CollisionShape2D.shape.get_extents()
	#$FloorDetector.enabled


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	velocity.y+= delta*GRAVITY
	if $FloorDetector.is_colliding():
		direction *= -1
		
		print("is colliding")
	if $FloorDetector2.is_colliding():
		direction *= -1
		
		print("is colliding")
	
	velocity.x = speed * direction
	$AnimatedSprite.flip_h = velocity.x > 0
	velocity = move_and_slide(velocity, Vector2.UP)
	
	


func _on_hurtbox_body_entered(body):
	speed = 0
	$AnimatedSprite.play("dead")
	set_collision_layer_bit(2, false)
	set_collision_mask_bit(0, false)
	
	
	
	yield(get_tree().create_timer(2), "timeout")
	queue_free()


extends Area2D
onready var anim = $AnimatedSprite
signal pickup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("spin")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_coin_body_entered(body):
	queue_free()

extends Area2D




func a2DStuff():
	pass


var yCoordinateEntered

# On body entered 
func _on_body_entered(body):
	var player = get_tree().get_nodes_in_group("player")[0].get_z_index()
	player = get_tree().get_nodes_in_group("player")[0].get_collision_layer()
	
	
	#body.global_position.x < global_position.x:
	print(body.global_position.y)#body is player enter/leave
	print(global_position.y)#this is area2d
	yCoordinateEntered = body.global_position.y
	

func _on_body_exited(body):
	#if body.global_position.y == yCoordinateEntered:
		#print("Left same way")
		#return
	if yCoordinateEntered == body.global_position.y:
		print("1")
		return
	#if leave from above (remember y-axis value grows downwards!!!!!!!!!!!!!!!!!!)
	if body.global_position.y < global_position.y:
		get_tree().get_nodes_in_group("player")[0].set_collision_mask_value(2, true)
		get_tree().get_nodes_in_group("player")[0].set_collision_mask_value(1, false)
		get_tree().get_nodes_in_group("player")[0].set_z_index(20)
		print("2")
		#ALSO CHANGE Z INDEX TO 0 HERE I THINK
		return
	#if leave from beneath
	if body.global_position.y > global_position.y:
		get_tree().get_nodes_in_group("player")[0].set_collision_mask_value(2, false)
		get_tree().get_nodes_in_group("player")[0].set_collision_mask_value(1, true)
		get_tree().get_nodes_in_group("player")[0].set_z_index(10)
		print("3")
		#ALSO CHANGE Z INDEX TO 10 HERE I THINK 
		return
	
	
	
	

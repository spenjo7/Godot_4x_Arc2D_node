@tool
extends Node2D
class_name Arc2D

@export var radius: float = 15.0:
	set( f ): 
		radius = abs(f) ## no negative values
		queue_redraw()

@export var angle: float = 45.0:
	set(f):
		angle = clampf(f, -360.0, 360.0)
		queue_redraw()

@export var color := Color.WHITE:
	set( c ): 
		color = c
		queue_redraw()
		
@export var fill := true :
	set(b):
		fill = b
		queue_redraw()

@export var outline_color := Color.BLACK:
	set( c ):
		outline_color = c
		queue_redraw()	

@export var outline_width := 1.0:
	set(f):
		outline_width = clampf(f, 0.0, 9999.9)
		queue_redraw()

@export var outline := true:
	set(b):
		outline = b
		queue_redraw()

@export var outline_edges:= true:
	set(b):
		outline_edges = b
		queue_redraw()

@export var edge_color := Color.GRAY:
	set(c):
		edge_color = c
		queue_redraw()
		
@export var anti_alias:= false:
	set(b):
		anti_alias = b
		queue_redraw()

func calc_endpoint(center, angle_point):
	return center + Vector2(cos(angle_point), sin(angle_point)) * radius

func _draw() -> void:
	var center = global_position
	var inner_radius = (radius - (outline_width/2)) if outline else radius
	
	var angle_from = 0
	var angle_to = deg_to_rad(angle)
	var point_count = abs(angle) * 2
	var e1 = calc_endpoint(center, 0)
	var e2 = calc_endpoint(center, angle_to) 
		## have to roate due to computer graphics being flipped

	var is_circle = angle >= 360 || angle <= -360
	
	if ( outline_edges ):
		draw_line(center, e1, edge_color, outline_width, anti_alias)
		draw_line(center, e2, edge_color, outline_width, anti_alias)
	
	if ( is_circle && fill ):
		draw_circle(center, radius, color, true)	
	elif (fill):
		draw_circle_arc_poly(center, angle_from, angle_to)
			
	if ( is_circle && outline ):
		draw_circle(center, radius, outline_color, false, outline_width, anti_alias)	
	elif( outline ):
		draw_arc( 
			center,	inner_radius, 
			angle_from, angle_to, 
			point_count, outline_color,
			outline_width, anti_alias
		)

	
func draw_circle_arc_poly(center, angle_from, angle_to, point_count = 32):
	var points_arc = PackedVector2Array()
	points_arc.push_back(center)
	var colors = PackedColorArray([color])

	for i in range(point_count + 1):
		var angle_point = (angle_from + i * (angle_to - angle_from) / point_count)
		points_arc.push_back(
			calc_endpoint(center, angle_point)
		)
		
	draw_polygon(points_arc, colors)

func _process( _delta ) -> void:
	queue_redraw()

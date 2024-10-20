# Godot_4x_Arc2D_node
Adding an Arc2D node class to Godot 4.x

This Repo includes an Arc2D.gd file, which can be imported into any Godot 4.x project.
Once the .gd file is in your project's file stucture, a new "Arc2D" node should be available in for lookup as Node type.

The Arc2D is primarily intended as a placeholder or prototyping tool. 

This class is a tool script, so it will update live in the editor
The class extends Node2D
This class has several additonal properties:

```
* float  angle
  The angle of the arc ( from 0 ); min -360.0 max 360.0
  If you set the angle to 360, the arc becomes a circle.

  Note: To change the starting angle, rotate the entire object.

* float  radius
  The radius of the arc.

* color  color
  The fill color for the arc.

* bool  fill
  Enable to color the area between the center and the arc.

* color  outline_color
    The stroke color for the arc.

* float  outline_width
  The thickness of the arc's border / stroke

* bool  outline
  Enable to color the border of the arc.

* bool  outline_edges
  Enable to draw lines from the center to the start and end points on the arc 

* edge_color: color
  The color for the edges

*  anti_alias: bool
  Enable to have the arc and edges drawn with anti-aliasing
```

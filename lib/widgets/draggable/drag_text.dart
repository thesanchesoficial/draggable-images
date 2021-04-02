import 'package:flutter/material.dart';

class DragText extends StatefulWidget {
  final Offset initPos;
  final String text;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double letterSpacing;

  DragText(
    this.text, 
    {this.initPos, 
    this.textAlign = TextAlign.left, 
    this.textDirection = TextDirection.ltr, 
    this.fontSize = 15, 
    this.color = Colors.black, 
    this.fontWeight = FontWeight.normal, 
    this.letterSpacing = 1
  }) : super();

  @override
  DragTextState createState() => DragTextState();
}

class DragTextState extends State<DragText> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Text(
            widget.text,
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            style: TextStyle(
              fontSize: widget.fontSize,
              color: widget.color,
              fontWeight: widget.fontWeight,
              letterSpacing: widget.letterSpacing
            ),
          ),
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = Offset(offset.dx, offset.dy - 94);
          });
        },
        childWhenDragging: SizedBox(),
        feedback: Container(
          padding: EdgeInsets.all(12),
          child: Text(
            widget.text,
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            style: TextStyle(
              fontSize: widget.fontSize,
              color: widget.color,
              fontWeight: widget.fontWeight,
              letterSpacing: widget.letterSpacing
            ),
          ),
        ),
      )
    );
  }
}
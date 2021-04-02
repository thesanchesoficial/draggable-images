import 'dart:io';
import 'package:flutter/material.dart';

class DragImage extends StatefulWidget {
  final Offset initPos;
  final File path;
  final String url;
  final double width;
  final double height;

  DragImage(
    {this.path, 
    this.url, 
    this.initPos,
    this.width = 50,
    this.height = 50,
  }) : super();

  @override
  DragImageState createState() => DragImageState();
}

class DragImageState extends State<DragImage> {
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
          child: widget.path == null 
            ? Image.network(
                widget.url,
                width: widget.width,
                height: widget.height,
              )
            : Image.file(
                widget.path,
                width: widget.width,
                height: widget.height,
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
          child: widget.path == null 
            ? Image.network(
                widget.url,
                width: widget.width,
                height: widget.height,
              )
            : Image.file(
                widget.path,
                width: widget.width,
                height: widget.height,
              ),
        ),
      )
    );
  }
}
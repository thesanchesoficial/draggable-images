import 'package:draggable/widgets/widgets.dart';
import 'package:draggable/main.dart';
import 'package:flutter/material.dart';

class DragWidget extends StatefulWidget {
  final DragTextEntity dragText;
  final DragImageEntity dragImage;
  final Offset position;

  const DragWidget.text({
    Key key,
    this.dragText,
    this.position
  }) : dragImage = null, super(key: key);

  const DragWidget.image({
    Key key,
    this.dragImage,
    this.position
  }) : dragText = null, super(key: key);

  @override
  _DragWidgetState createState() => _DragWidgetState(
    dragImage: dragImage,
    dragText: dragText,
    position: position,
  );
}

class _DragWidgetState extends State<DragWidget> {
  DragTextEntity dragText;
  DragImageEntity dragImage;
  Offset position;

  _DragWidgetState({this.dragImage, this.dragText, this.position});

  @override
  Widget build(BuildContext context) {
    if (dragText != null) {
      return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Text(
              dragText.text,
              textAlign: dragText.textAlign,
              textDirection: dragText.textDirection,
              style: TextStyle(
                fontSize: dragText.fontSize,
                color: dragText.color,
                fontWeight: dragText.fontWeight,
                letterSpacing: dragText.letterSpacing
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              editWidget = this.widget.dragText;
              position = Offset(offset.dx, offset.dy - 94);
            });
          },
          childWhenDragging: SizedBox(),
          feedback: Container(
            padding: EdgeInsets.all(12),
            child: Material(
              color: Colors.transparent,
              child: Text(
                dragText.text,
                textAlign: dragText.textAlign,
                textDirection: dragText.textDirection,
                style: TextStyle(
                  fontSize: dragText.fontSize,
                  color: dragText.color,
                  fontWeight: dragText.fontWeight,
                  letterSpacing: dragText.letterSpacing
                ),
              ),
            ),
          ),
        )
      );
    } else {
      return Container();
    }
  }
}
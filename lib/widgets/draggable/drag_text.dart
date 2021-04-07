import 'dart:convert';
import 'package:flutter/material.dart';

class DragTextEntity {
  final Offset initPos;
  final String text;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double letterSpacing;

  DragTextEntity({
    this.initPos,
    this.text,
    this.textAlign,
    this.textDirection,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.letterSpacing,
  });

  @override
  String toString() {
    return 'DragText(initPos: $initPos, text: $text, textAlign: $textAlign, textDirection: $textDirection, fontSize: $fontSize, color: $color, fontWeight: $fontWeight, letterSpacing: $letterSpacing)';
  }

  Map<String, dynamic> toMap() {
    return {
      'initPos': initPos,
      'text': text,
      'textAlign': textAlign,
      'textDirection': textDirection,
      'fontSize': fontSize,
      'color': color.value,
      'fontWeight': fontWeight,
      'letterSpacing': letterSpacing,
    };
  }

  // DragTextEntity copyWith({
  //   Offset initPos,
  //   String text,
  //   TextAlign textAlign,
  //   TextDirection textDirection,
  //   double fontSize,
  //   Color color,
  //   FontWeight fontWeight,
  //   double letterSpacing,
  // }) {
  //   return DragTextEntity(
  //     initPos: initPos ?? this.initPos,
  //     text: text ?? this.text,
  //     textAlign: textAlign ?? this.textAlign,
  //     textDirection: textDirection ?? this.textDirection,
  //     fontSize: fontSize ?? this.fontSize,
  //     color: color ?? this.color,
  //     fontWeight: fontWeight ?? this.fontWeight,
  //     letterSpacing: letterSpacing ?? this.letterSpacing,
  //   );
  // }

  factory DragTextEntity.fromMap(Map<String, dynamic> map) {
    return DragTextEntity(
      initPos: map['initPos'],
      text: map['text'],
      textAlign: map['textAlign'],
      textDirection: map['textDirection'],
      fontSize: map['fontSize'],
      color: Color(map['color']),
      fontWeight: map['fontWeight'],
      letterSpacing: map['letterSpacing'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DragTextEntity.fromJson(String source) => DragTextEntity.fromMap(json.decode(source));

  DragTextEntity copyWith({
    Offset initPos,
    String text,
    TextAlign textAlign,
    TextDirection textDirection,
    double fontSize,
    Color color,
    FontWeight fontWeight,
    double letterSpacing,
  }) {
    return DragTextEntity(
      initPos: initPos ?? this.initPos,
      text: text ?? this.text,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
      fontWeight: fontWeight ?? this.fontWeight,
      letterSpacing: letterSpacing ?? this.letterSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DragTextEntity &&
      other.initPos == initPos &&
      other.text == text &&
      other.textAlign == textAlign &&
      other.textDirection == textDirection &&
      other.fontSize == fontSize &&
      other.color == color &&
      other.fontWeight == fontWeight &&
      other.letterSpacing == letterSpacing;
  }

  @override
  int get hashCode {
    return initPos.hashCode ^
      text.hashCode ^
      textAlign.hashCode ^
      textDirection.hashCode ^
      fontSize.hashCode ^
      color.hashCode ^
      fontWeight.hashCode ^
      letterSpacing.hashCode;
  }
}
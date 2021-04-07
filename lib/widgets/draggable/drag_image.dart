import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class DragImageEntity {
  final Offset initPos;
  final File path;
  final String url;
  final double width;
  final double height;

  DragImageEntity({
    this.initPos,
    this.path,
    this.url,
    this.width,
    this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'initPos': initPos,
      'path': path,
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory DragImageEntity.fromMap(Map<String, dynamic> map) {
    return DragImageEntity(
      initPos: map['initPos'],
      path: map['path'],
      url: map['url'],
      width: map['width'],
      height: map['height'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DragImageEntity.fromJson(String source) => DragImageEntity.fromMap(json.decode(source));

  DragImageEntity copyWith({
    Offset initPos,
    File path,
    String url,
    double width,
    double height,
  }) {
    return DragImageEntity(
      initPos: initPos ?? this.initPos,
      path: path ?? this.path,
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  String toString() {
    return 'DragImageEntity(initPos: $initPos, path: $path, url: $url, width: $width, height: $height)';
  }
}
import 'package:flutter/material.dart';

extension JKExtension on Color {
  //color 转 16进制string
  String toHex() {
    List temp = [this.alpha, this.red, this.green, this.blue];
    String color = '#';
    for (var obj in temp) {
      String str = obj.toRadixString(16);
      color += str;
    }
    return color.toUpperCase();
  }
}

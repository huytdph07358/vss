import 'package:flutter/material.dart';

enum ColorEnum {
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  cyan('Cyan', Colors.cyan),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  lime('Lime', Colors.lime),
  yellow('Yellow', Colors.yellow),
  amber('Amber', Colors.amber),
  orange('Orange', Colors.orange),
  pink('Pink', Colors.pink),
  red('Red', Colors.red),
  purple('Purple', Colors.purple),
  brown('Brown', Colors.brown);

  const ColorEnum(this.label, this.color);
  final String label;
  final Color color;
}

import 'package:flutter/material.dart';

class NText extends StatelessWidget {
  const NText({
    super.key,
    required this.text,
    this.size = 16,
    this.color,
    this.weight,
    this.textAlign,
    this.font = 'regular',
    this.maxLines,
  });
  
  final String text;
  final double size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final String? font;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color ?? Colors.grey[900],
        fontWeight: weight ?? FontWeight.normal,
        fontFamily: font,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

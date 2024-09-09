import 'package:flutter/material.dart';
import 'package:note_app/features/views/theme/colors.dart';

class NFormField extends StatelessWidget {
  const NFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.prefix,
    this.suffix,
    this.keyboard,
    this.hideText = false,
    this.toggleSuffix,
    this.height  = 50,
    this.alignment = Alignment.center,
    this.maxLines = 1,
  });

  final String hint;
  final TextEditingController controller;
  final String? prefix;
  final String? suffix;
  final TextInputType? keyboard;
  final bool hideText;
  final Function()? toggleSuffix;
  final double height;
  final AlignmentGeometry alignment;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(right: 12, left: prefix == null ? 12 : 0 ),
      alignment: alignment,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        obscureText: hideText,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefix == null
              ? null
              : Image.asset(
                  'assets/images/$prefix',
                ),
          suffix: suffix == null
              ? null
              : GestureDetector(
                  onTap: toggleSuffix,
                  child: Image.asset(
                    'assets/images/$suffix',
                  ),
                ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontFamily: 'regular',
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'regular',
        ),
      ),
    );
  }
}

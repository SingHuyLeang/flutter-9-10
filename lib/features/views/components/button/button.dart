import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/views/components/widgets/text.dart';
import 'package:note_app/util/theme/colors.dart';

class NButton extends StatelessWidget {
  const NButton({
    super.key,
    required this.onTap,
    this.text,
    this.icon,
    this.width,
    this.height,
  });

  final void Function() onTap;
  final String? text;
  final String? icon;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NText(text: "$text", color: tertiary, weight: FontWeight.bold),
            if (icon != null)
              Row(
                children: [
                  const SizedBox(width: 15),
                  Image.asset(icon!, color: tertiary),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

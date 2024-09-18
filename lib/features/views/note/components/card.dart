import 'package:flutter/material.dart';
import 'package:note_app/features/model/note.dart';

import '../../../../util/theme/colors.dart';
import '../../components/widgets/text.dart';

Widget noteCard(
  Note note, {
  void Function()? onTap,
  void Function()? onLongTap,
}) {
  return GestureDetector(
    onTap: onTap,
    onLongPress: onLongTap,
    child: Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NText(text: note.date, weight: FontWeight.bold),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NText(
                      text: note.title,
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    NText(
                      text: note.time,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                NText(
                  text: note.content,
                  size: 16,
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

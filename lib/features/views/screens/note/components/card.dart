import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../components/widgets/text.dart';

Widget card() {
  return Container(
    width: double.infinity,
    height: 200,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NText(text: '21 AUG 2024', weight: FontWeight.bold),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NText(
                    text: 'Untitled',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  NText(
                    text: '10:20 AM',
                    size: 16,
                  ),
                ],
              ),
              SizedBox(height: 10),
              NText(
                text:
                    'Reloaded 1 of 710 libraries in 477ms (compile: 19 ms, reload: 189 ms, reassemble: 195 ms).D/EGL_emulation( 8341): app_time_stats: avg=14536.51ms min=14536.51ms max=14536.51ms count=1Reloaded 1 of 710 libraries in 565ms (compile: 24 ms, reload: 235 ms, reassemble: 198 ms).D/EGL_emulation( 8341): app_time_stats: avg=10227.45ms min=10227.45ms max=10227.45ms count=1',
                size: 16,
                maxLines: 4,
              ),
              
            ],
          ),
        ),
      ],
    ),
  );
}

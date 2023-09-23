import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  final String title;
  final Color color;
  final String content;

  const TextInfo(
      {super.key,
      required this.title,
      required this.color,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: color,
        ),
        Text(title),
        Spacer(),
        Text(content)
      ],
    );
  }
}

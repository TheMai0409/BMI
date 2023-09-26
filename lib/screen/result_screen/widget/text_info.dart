import 'package:bmi/utils/constants.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 5),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: color,
          ),
          SizedBox(width: 20,),
          Text(title, style: TextStyle(color: textColor, fontSize: textSizeUnit, fontWeight: FontWeight.w500),),
          Spacer(),
          Text(content)
        ],
      ),
    );
  }
}

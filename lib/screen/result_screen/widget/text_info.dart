import 'package:bmi/utils/constants.dart';
import 'package:bmi/utils/utils.dart';
import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  final String title;
  final Color color;
  final String content;
  final double bmi;
  double? bmiDataStart;
  double? bmiDataEnd;

  TextInfo({
    super.key,
    required this.title,
    required this.color,
    required this.content,
    required this.bmi,
    this.bmiDataStart,
    this.bmiDataEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 6),
      child: Row(
        children: [
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: checkYourBMI(
              bmi: bmi,
              bmiDataStart: bmiDataStart,
              bmiDataEnd: bmiDataEnd,
            ),
            child: Icon(
              Icons.circle,
              color: color,
              size: 13,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: checkYourBMI(
                  bmi: bmi,
                  bmiDataStart: bmiDataStart,
                  bmiDataEnd: bmiDataEnd,
                ) ? color
                    : Colors.grey,
                fontSize:  checkYourBMI(
                  bmi: bmi,
                  bmiDataStart: bmiDataStart,
                  bmiDataEnd: bmiDataEnd,
                ) ? 18
                    : 16,
                fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Text(content,  style: TextStyle(
              color: checkYourBMI(
                bmi: bmi,
                bmiDataStart: bmiDataStart,
                bmiDataEnd: bmiDataEnd,
              ) ? color
                  : Colors.black,
              fontSize:  checkYourBMI(
                bmi: bmi,
                bmiDataStart: bmiDataStart,
                bmiDataEnd: bmiDataEnd,
              ) ? 18
                  : 16,
              fontWeight: FontWeight.w700),)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CardGender extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const CardGender({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.43,
      child: Card(
        elevation: 0,
        color: const Color(0xFFEFEFEF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultBorderRadius),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Icon(
                icon,
                color: color,
                size: 60,
              ),
            ),
            Padding(

              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: textSizeSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

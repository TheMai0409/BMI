import 'package:bmi/component/ink_well_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CardGender extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final BorderSide border;

  const CardGender({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.43,
        child: Card(
          elevation: 0,
          color: cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(defaultBorderRadius),
              ),
              side: border),
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
      ),
      onTap: onTap,
    );
  }
}

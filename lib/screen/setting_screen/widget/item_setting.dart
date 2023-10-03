import 'package:bmi/component/ink_well_button.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final Color colorContainer;
  final String title;
  final VoidCallback onTap;

  const ItemSetting({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
    required this.color,
    required this.colorContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: InkWellButton(
        borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: colorContainer,
              ),
              child: Icon(
                iconData,
                color: color,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFFEFEFEF),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ))
          ],
        ),
      ),
    );
  }
}

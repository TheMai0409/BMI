import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ink_well_button.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final VoidCallback goToScreen;

  const CustomAppBar({super.key, this.title, required this.goToScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(
          top: 10, left: defaultPadding, right: defaultPadding),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              title ?? "",
              style: const TextStyle(
                fontSize: textSizeLarge,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFFD1EDFF),
            ),
            child: InkWellButton(
                onTap: goToScreen,
                child: SvgPicture.asset(
                  'assets/images/ic_setting.svg',
                )),
          )
        ],
      ),
    );
  }
}

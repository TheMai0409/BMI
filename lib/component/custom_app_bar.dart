import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/navigation_service.dart';
import '../utils/routes.dart';
import 'ink_well_button.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;

  const CustomAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: defaultPadding, left: defaultPadding,right: defaultPadding),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            style: const TextStyle(
              fontSize: textSizeNumber,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWellButton(
            child: SvgPicture.asset(
              'assets/images/ic_setting.svg',
            ),
            onTap: () => {
              navService.pushNamed(RouteConstants.settingScreen)},
          )
        ],
      ),
    );
  }
}

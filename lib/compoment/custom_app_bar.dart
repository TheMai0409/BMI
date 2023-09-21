import 'package:bmi/compoment/ink_well_button.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/navigation_service.dart';
import '../utils/routes.dart';

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
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title ?? "",
              style: const TextStyle(
                fontSize: textSizeLarge,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWellButton(
              child: SvgPicture.asset(
                'assets/images/ic_setting.svg',
              ),
              onTap: () => {
                navService.pushNamedAndRemoveUntil(RouteConstants.settingScreen)
              },
            ),
          )
        ],
      ),
    );
  }
}

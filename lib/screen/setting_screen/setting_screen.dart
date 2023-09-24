import 'package:bmi/screen/setting_screen/widget/item_setting.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../component/ink_well_button.dart';
import '../../utils/constants.dart';
import '../../utils/navigation_service.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0.0, 0.0),
          child: Container(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 10, left: defaultPadding, right: defaultPadding),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWellButton(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                      onTap: () => {navService.goBack()},
                    ),
                    Spacer(),
                    Text(
                      "Setting",
                      style: const TextStyle(
                        fontSize: textSizeLarge,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: Text(
                  'Setting',
                  style: TextStyle(
                      color: textColor,
                      fontSize: textSizeSmall,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.language,
                title: 'Language',
                action: () {},
                color: Color(0xFF4A6CF1),
                colorContainer: Color(0xFFE6EAFA),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.delete_rounded,
                title: 'Delete data',
                action: () {},
                color: Color(0xFFFF0000),
                colorContainer: Color(0xFFF8E2E2),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: Text(
                  'Other',
                  style: TextStyle(
                      color: textColor,
                      fontSize: textSizeSmall,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.share,
                title: 'Share App',
                action: () {},
                color: Color(0xFF5AAF43),
                colorContainer: Color(0xFFD7FFD5),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.mail,
                title: 'Mail',
                action: () {},
                color: Color(0xFF3140EE),
                colorContainer: Color(0xFFDDE6F8),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.rate_review_sharp,
                title: 'Rate us',
                action: () {},
                color: Color(0xFFC800FF),
                colorContainer: Color(0xFFF5DEFD),
              ),
              PanaraConfirmDialog.show(
                context,
                title: "Hello",
                message: "This is the PanaraConfirmDialog",
                confirmButtonText: "Confirm",
                cancelButtonText: "Cancel",
                onTapCancel: () {
                  Navigator.pop(context);
                },
                onTapConfirm: () {
                  Navigator.pop(context);
                },
                panaraDialogType: PanaraDialogType.normal,
                barrierDismissible:
                    false, // optional parameter (default is true)
              )
            ],
          ),
        ));
  }
}

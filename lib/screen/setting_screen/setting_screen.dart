import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/setting_screen/widget/item_setting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../component/ink_well_button.dart';
import '../../utils/constants.dart';
import '../../utils/navigation_service.dart';
import '../main/bloc/language_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                title: 'home'.tr(),
                onTap: () {
                  context
                      .read<LanguageBloc>()
                      .add(ChangeLanguage(locale: 'en'));
                  EasyLocalization.of(context)!.setLocale(Locale('en'));
                },
                color: Color(0xFF4A6CF1),
                colorContainer: Color(0xFFE6EAFA),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.delete_rounded,
                title: 'Delete data',
                onTap: () {
                  showCustomDialog(
                      title: 'Delete data', message: 'Are you sure?');
                },
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
                onTap: () {},
                color: Color(0xFF5AAF43),
                colorContainer: Color(0xFFD7FFD5),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.mail,
                title: 'Mail',
                onTap: () {},
                color: Color(0xFF3140EE),
                colorContainer: Color(0xFFDDE6F8),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.star_border_outlined,
                title: 'Rate us',
                onTap: () {},
                color: Color(0xFFC800FF),
                colorContainer: Color(0xFFF5DEFD),
              ),
            ],
          ),
        ));
  }

  void showCustomDialog({required String title, required String message}) {
    PanaraConfirmDialog.show(
      context,
      title: title,
      message: message,
      color: Color(0xFFFF0000),
      confirmButtonText: "Confirm",
      cancelButtonText: "Cancel",
      onTapCancel: () {
        Navigator.pop(context);
      },
      onTapConfirm: () {
        deleteUserBMI();
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.custom,
      barrierDismissible: false,
    );
  }
}

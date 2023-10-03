import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/setting_screen/widget/item_setting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:share_plus/share_plus.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xFFE4E6E8),
                      ),
                      child: InkWellButton(
                          child: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 26,
                                color: Color(0xFF3E4141),
                              ),
                            ),
                          ),
                          onTap: () => {navService.goBack()}),
                    ),
                    Spacer(),
                    Text(
                      'setting'.tr(),
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
                  'setting'.tr(),
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
                title: 'language'.tr(),
                onTap: () {
                  showLanguageDialog(title: 'language'.tr());
                },
                color: Color(0xFF4A6CF1),
                colorContainer: Color(0xFFE6EAFA),
              ),
              SizedBox(
                height: 25,
              ),
              ItemSetting(
                iconData: Icons.delete_rounded,
                title: 'delete_data'.tr(),
                onTap: () {
                  showCustomDialog(
                      title: 'delete_data'.tr(), message: 'are_sure'.tr());
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
                  'other'.tr(),
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
                title: 'share_app'.tr(),
                onTap: () {
                  final box = context.findRenderObject() as RenderBox?;
                  //
                  Share.share(
                    'Link App in CH Play $linkAppInCHPlay \nLink App In AppStore $linkAppInAppStore',
                    subject: null,
                    sharePositionOrigin:
                        box!.localToGlobal(Offset.zero) & box.size,
                  );
                },
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
                title: 'rate_us'.tr(),
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
      confirmButtonText: "confirm".tr(),
      cancelButtonText: "cancel".tr(),
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

  void showLanguageDialog({required String title}) {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSizeMid,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWellButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  children: [
                    Text('English',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    Spacer(),
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: EasyLocalization.of(context)!.currentLocale ==
                          Locale('en'),
                      child: Icon(
                        Icons.circle,
                        color: Colors.indigoAccent,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                EasyLocalization.of(context)!.setLocale(Locale('en'));
                context.read<LanguageBloc>().add(ChangeLanguage(locale: 'en'));
                Navigator.pop(context);
              },
            ),
            InkWellButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'Tiếng Việt',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: EasyLocalization.of(context)!.currentLocale ==
                          Locale('vi'),
                      child: Icon(
                        Icons.circle,
                        color: Colors.indigoAccent,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                EasyLocalization.of(context)!.setLocale(Locale('vi'));
                context.read<LanguageBloc>().add(ChangeLanguage(locale: 'vi'));
                Navigator.pop(context);
              },
            ),
            Spacer(),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEAEBEC),
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultBorderRadius),
                    ),
                  ),
                  child: InkWellButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultBorderRadius),
                    ),
                    child: Center(
                      child: Text(
                        'cancel'.tr(),
                        style: TextStyle(
                          fontSize: textSizeSmall,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) => errorDialog,
    );
  }
}

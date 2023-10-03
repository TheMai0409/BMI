import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/setting_screen/widget/item_setting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share_plus/share_plus.dart';

import '../../component/ink_well_button.dart';
import '../../utils/constants.dart';
import '../../utils/navigation_service.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  RateMyApp rateMyApp = RateMyApp(
    minDays: 0,
    minLaunches: 2,
    googlePlayIdentifier: playStoreId,
    appStoreIdentifier: appstoreId,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await rateMyApp.init();
    });
  }

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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xFFE4E6E8),
                      ),
                      child: InkWellButton(
                          child: const Align(
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
                    const Spacer(),
                    Text(
                      'setting'.tr(),
                      style: const TextStyle(
                        fontSize: textSizeLarge,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: Text(
                  'setting'.tr(),
                  style: const TextStyle(
                      color: textColor,
                      fontSize: textSizeSmall,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ItemSetting(
                iconData: Icons.language,
                title: 'language'.tr(),
                onTap: () {
                  showLanguageDialog(title: 'select_language'.tr());
                },
                color: const Color(0xFF4A6CF1),
                colorContainer: const Color(0xFFE6EAFA),
              ),
              const SizedBox(
                height: 15,
              ),
              ItemSetting(
                iconData: Icons.delete_rounded,
                title: 'delete_data'.tr(),
                onTap: () {
                  showCustomDialog(
                      title: 'delete_data'.tr(), message: 'are_sure'.tr());
                },
                color: const Color(0xFFFF0000),
                colorContainer: const Color(0xFFF8E2E2),
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: Text(
                  'other'.tr(),
                  style: const TextStyle(
                      color: textColor,
                      fontSize: textSizeSmall,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 15,
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
                color: const Color(0xFF5AAF43),
                colorContainer: const Color(0xFFD7FFD5),
              ),
              const SizedBox(
                height: 15,
              ),
              // ItemSetting(
              //   iconData: Icons.mail,
              //   title: 'Mail',
              //   onTap: () {},
              //   color: Color(0xFF3140EE),
              //   colorContainer: Color(0xFFDDE6F8),
              // ),
              // SizedBox(
              //   height: 25,
              // ),
              ItemSetting(
                iconData: Icons.star_border_outlined,
                title: 'rate_us'.tr(),
                onTap: () {
                  rateMyApp.showStarRateDialog(
                    context,
                    title: 'rate'.tr(),
                    message: 'rate_content'.tr(),
                    starRatingOptions: const StarRatingOptions(initialRating: 5),
                    actionsBuilder: actionsBuilder,
                  );
                },
                color: const Color(0xFFC800FF),
                colorContainer: const Color(0xFFF5DEFD),
              ),
            ],
          ),
        ));
  }

  List<Widget> actionsBuilder(BuildContext context, double? stars) =>
      stars == null
          ? [buildCancelButton()]
          : [buildOkButton(stars), buildCancelButton()];

  Widget buildOkButton(double stars) => TextButton(
        child: Text('okay'.tr()),
        onPressed: () async {
          final launchAppStore = stars >= 4;

          const event = RateMyAppEventType.rateButtonPressed;

          await rateMyApp.callEvent(event);

          if (launchAppStore) {
            rateMyApp.launchStore();
          }

          Navigator.of(context).pop();
        },
      );

  Widget buildCancelButton() => RateMyAppNoButton(
        rateMyApp,
        text: "cancel".tr(),
      );

  void showCustomDialog({required String title, required String message}) {
    PanaraConfirmDialog.show(
      context,
      title: title,
      message: message,
      color: const Color(0xFFFF0000),
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
      child: SizedBox(
        height: 250.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: textColor,
                  fontSize: textSizeMid,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWellButton(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  children: [
                    const Text('English',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: EasyLocalization.of(context)!.currentLocale ==
                          const Locale('en'),
                      child: const Icon(
                        Icons.circle,
                        color: Colors.indigoAccent,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                EasyLocalization.of(context)!.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            InkWellButton(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  children: [
                    const Text(
                      'Tiếng Việt',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: EasyLocalization.of(context)!.currentLocale ==
                          const Locale('vi'),
                      child: const Icon(
                        Icons.circle,
                        color: Colors.indigoAccent,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                EasyLocalization.of(context)!.setLocale(const Locale('vi'));
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Container(
                  height: 60,
                  width: 80,
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
                    borderRadius: const BorderRadius.all(
                      Radius.circular(defaultBorderRadius),
                    ),
                    child: Center(
                      child: Text(
                        'close'.tr(),
                        style: const TextStyle(
                          fontSize: 20,
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

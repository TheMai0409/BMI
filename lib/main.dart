import 'package:bmi/screen/detail_article_screen/detail_article_screen.dart';
import 'package:bmi/screen/main_screen/screen/main_screen.dart';
import 'package:bmi/screen/result_screen/result_screen.dart';
import 'package:bmi/screen/setting_screen/setting_screen.dart';
import 'package:bmi/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

import 'di/injection.dart';
import 'manager/hive_manager.dart';
import 'screen/splash_screen/screen/splash_screen.dart';
import 'utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureCoreDependencies();
  await openBox();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late RateMyApp rateMyApp;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: NavigationService.navigationKey,
      initialRoute: RouteConstants.root,
      routes: {
        RouteConstants.root: (_) => const SplashScreen(),
        RouteConstants.settingScreen: (_) => const SettingScreen(),
        RouteConstants.mainScreen: (_) => const MainScreen(),
        RouteConstants.resultScreen: (_) => const ResultScreen(),
        RouteConstants.detailArticleScreen: (_) => const DetailArticleScreen(),
      },
    );
  }
}

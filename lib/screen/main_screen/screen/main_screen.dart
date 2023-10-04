import 'package:bmi/di/injection.dart';
import 'package:bmi/screen/article_screen/article_screen.dart';
import 'package:bmi/screen/history_screen/history_screen.dart';
import 'package:bmi/screen/home_screen/home_screen.dart';
import 'package:bmi/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../../utils/navigation_service.dart';
import '../../../utils/routes.dart';
import '../bloc/main_screen_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainScreenBloc>(),
      child: BlocConsumer<MainScreenBloc, MainScreenState>(
        listener: (context, state) {
          if (state is TabChanged) {
            _controller.animateToPage(
              state.tabIndex,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          }
          if (state is ShowRateSuccess) {
            if (state.rateMyApp.shouldOpenDialog) {
              state.rateMyApp.showRateDialog(context,
                  title: 'rate'.tr(),
                  message: 'rate_content_2'.tr(),
                  rateButton: 'button_rate'.tr(),
                  noButton: 'no_thank'.tr(),
                  laterButton: 'maybe_later'.tr());
            }
          }
        },
        builder: (context, state) {
          return RateMyAppBuilder(
            rateMyApp: RateMyApp(
              googlePlayIdentifier: playStoreId,
              appStoreIdentifier: appstoreId,
              minDays: 0,
              minLaunches: 2,
              // remindDays: 1,
              // remindLaunches: 1,
            ),
            builder: (context) => Scaffold(
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFE8E8E8), //New
                        blurRadius: 10.0,
                        offset: Offset(0, -1))
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: SizedBox(
                    height: 75,
                    child: BottomNavigationBar(
                      backgroundColor: primaryColor,
                      currentIndex: (state is TabChangedViewPage)
                          ? state.tabIndex
                          : _currentIndex,
                      onTap: (index) {
                        if (_currentIndex == index) {
                          return;
                        }
                        _currentIndex = index;
                        context
                            .read<MainScreenBloc>()
                            .add(OnTabChange(index: _currentIndex));
                      },
                      selectedItemColor: Colors.indigoAccent,
                      iconSize: 27,
                      selectedFontSize: 14,
                      type: BottomNavigationBarType.fixed,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: const Icon(
                            Icons.home_filled,
                          ),
                          label: 'bmi'.tr(),
                        ),
                        BottomNavigationBarItem(
                          icon: const Icon(
                            Icons.article,
                          ),
                          label: 'article'.tr(),
                        ),
                        BottomNavigationBarItem(
                          icon: const Icon(
                            Icons.date_range,
                          ),
                          label: 'history'.tr(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: PageView(
                onPageChanged: (index) {
                  _currentIndex = index;

                  context
                      .read<MainScreenBloc>()
                      .add(OnScrollViewPage(index: _currentIndex));
                  // _controller.animateToPage(index,
                  //     duration: const Duration(milliseconds: 700),
                  //     curve: Curves.easeIn);
                },
                controller: _controller,
                children: [
                  HomeScreen(
                    goToSettingScreen: goToSettingScreen,
                  ),
                  ArticleScreen(
                    goToSettingScreen: goToSettingScreen,
                  ),
                  HistoryScreen(
                    goToSettingScreen: goToSettingScreen,
                  ),
                ],
              ),
            ),
            onInitialized: (context, rateMyApp) {
              context.read<MainScreenBloc>().add(ShowRate(rateMyApp));
            },
          );
        },
      ),
    );
  }

  void goToSettingScreen() {
    navService
        .pushNamed(RouteConstants.settingScreen)
        .then((value) => setState(() {}));
  }
}

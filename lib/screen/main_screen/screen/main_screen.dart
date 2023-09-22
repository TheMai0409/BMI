import 'package:bmi/di/injection.dart';
import 'package:bmi/screen/article_screen/article_screen.dart';
import 'package:bmi/screen/history_screen/history_screen.dart';
import 'package:bmi/screen/home_screen/home_screen.dart';
import 'package:bmi/screen/main/bloc/language_bloc.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            _controller.animateToPage(state.tabIndex,
                duration: const Duration(microseconds: 500000),
                curve: Curves.easeInOutCubic);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                      if (_currentIndex % 2 == 0) {
                        context
                            .read<LanguageBloc>()
                            .add(ChangeLanguage(locale: 'en'));
                      } else {
                        context
                            .read<LanguageBloc>()
                            .add(ChangeLanguage(locale: 'vi'));
                      }

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
                        label: AppLocalizations.of(context)!.home,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.article,
                        ),
                        label: AppLocalizations.of(context)!.article,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.date_range,
                        ),
                        label: AppLocalizations.of(context)!.history,
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
              children: const [
                HomeScreen(),
                ArticleScreen(),
                HistoryScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:bmi/di/injection.dart';
import 'package:bmi/screen/article_screen/article_screen.dart';
import 'package:bmi/screen/history_screen/history_screen.dart';
import 'package:bmi/screen/home_screen/home_screen.dart';
import 'package:bmi/screen/main/bloc/language_bloc.dart';
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
            _controller.jumpToPage(state.tabIndex);
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, //New
                      blurRadius: 10.0,
                      offset: Offset(0, -1))
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.blue,
                  currentIndex: _currentIndex,
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
                  selectedItemColor: Theme.of(context).primaryColorLight,
                  selectedIconTheme: const IconThemeData()
                      .copyWith(color: Theme.of(context).primaryColorLight),
                  iconSize: 30,
                  selectedFontSize: 16,
                  unselectedFontSize: 14,
                  type: BottomNavigationBarType.fixed,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.account_box,
                      ),
                      label: AppLocalizations.of(context)!.home,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.date_range,
                      ),
                      label: AppLocalizations.of(context)!.article,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.stacked_bar_chart,
                      ),
                      label: AppLocalizations.of(context)!.history,
                    ),
                  ],
                ),
              ),
            ),
            body: PageView(
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

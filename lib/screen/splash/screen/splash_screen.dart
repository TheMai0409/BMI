import 'package:bmi/di/injection.dart';
import 'package:bmi/screen/main_screen/screen/main_screen.dart';
import 'package:bmi/screen/splash/bloc/splash_bloc.dart';
import 'package:bmi/screen/splash/screen/widget/splash_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashBloc>(),
      child: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(GoToMainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
        if (state is SplashInitial) {
          return const SplashScreenWidget();
        }
        if (state is GoToMainScreenSuccess) {
          return const MainScreen();
        }
        return const Center();
      }),
    );
  }
}

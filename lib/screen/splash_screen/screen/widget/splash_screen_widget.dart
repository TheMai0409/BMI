import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(150.0),
                  child: SvgPicture.asset('assets/images/logo_app.svg',
                      semanticsLabel: 'Acme Logo'),
                ),
              ),
            ),
            // const Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Text(
            //       "PlanText",
            //       style: TextStyle(color: textColor),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

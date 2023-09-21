import 'dart:developer';

import 'package:bmi/compoment/custom_app_bar.dart';
import 'package:bmi/screen/home_screen/widget/card_input_info.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0.0, 0.0),
        child: Container(),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [  const CustomAppBar(
                  title: 'BMI',
                ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: defaultPadding,
                            right: 10.0,
                          ),
                          child: CardInputInfo(
                            title: 'Weight',
                            infoIndex: (height) {
                              log('Height $height');
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: CardInputInfo(
                            title: 'Height',
                            infoIndex: (height) {
                              log('Height $height');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),
            const Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text("Caculation"),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:bmi/component/custom_app_bar.dart';
import 'package:bmi/component/ink_well_button.dart';
import 'package:bmi/di/injection.dart';
import 'package:bmi/screen/home_screen/bloc/home_screen_bloc.dart';
import 'package:bmi/screen/home_screen/widget/card_gender.dart';
import 'package:bmi/screen/home_screen/widget/card_input_info.dart';
import 'package:bmi/utils/constants.dart';
import 'package:bmi/utils/navigation_service.dart';
import 'package:bmi/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentAge;
  late int _currentGender;

  @override
  void initState() {
    super.initState();
    _currentAge = 1;
    _currentGender = 1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenBloc>(),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const CustomAppBar(
                            title: 'BMI',
                          ),
                          const SizedBox(
                            height: 70,
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
                                    initValue: '0.0',
                                    textSuffix: 'kg',
                                    infoIndex: (height) {
                                      log('Height $height');
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: defaultPadding),
                                  child: CardInputInfo(
                                    title: 'Height',
                                    textSuffix: 'cm',
                                    initValue: '0.0',
                                    infoIndex: (height) {
                                      log('Height $height');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: defaultPadding,
                                    right: 10.0,
                                  ),
                                  child: CardGender(
                                    title: 'Male',
                                    icon: Icons.male_rounded,
                                    color: Colors.indigoAccent,
                                    onTap: () {
                                      _currentGender = 0;
                                      context
                                          .read<HomeScreenBloc>()
                                          .add(OnTapGender(gender: 0));
                                    },
                                    border:(_currentGender == 0)
                                        ? BorderSide(
                                        color: Colors.indigoAccent, width: 3.0)
                                        : BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: defaultPadding),
                                  child: CardGender(
                                    title: 'Female',
                                    icon: Icons.female_rounded,
                                    color: Colors.pink,
                                    onTap: () {
                                      _currentGender = 1;
                                      context
                                          .read<HomeScreenBloc>()
                                          .add(OnTapGender(gender: 1));
                                    },
                                    border: (_currentGender == 1)
                                        ? BorderSide(
                                            color: Colors.pink, width: 3.0)
                                        : BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Age',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: textSizeSmall,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Card(
                              elevation: 0,
                              color: const Color(0xFFEFEFEF),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(defaultBorderRadius),
                                ),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    NumberPicker(
                                        value: _currentAge,
                                        minValue: 1,
                                        maxValue: 100,
                                        textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: textSizeMid,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        selectedTextStyle: const TextStyle(
                                            color: textColor,
                                            fontSize: textSizeNumber,
                                            fontWeight: FontWeight.w500),
                                        step: 1,
                                        itemHeight: 100,
                                        axis: Axis.horizontal,
                                        onChanged: (age) {
                                          _currentAge = age;
                                          context
                                              .read<HomeScreenBloc>()
                                              .add(OnSwipeAge(age: age));
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0827F1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadius),
                          ),
                        ),
                        child: InkWellButton(
                          onTap: () => {
                            navService.pushNamed(RouteConstants.resultScreen)
                          },
                          child: Center(
                            child: Text(
                              'Caculation',
                              style: TextStyle(
                                fontSize: textSizeLarge,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
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
        },
      ),
    );
  }
}

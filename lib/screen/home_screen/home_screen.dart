import 'package:bmi/component/custom_app_bar.dart';
import 'package:bmi/component/ink_well_button.dart';
import 'package:bmi/di/injection.dart';
import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/home_screen/bloc/home_screen_bloc.dart';
import 'package:bmi/screen/home_screen/widget/card_gender.dart';
import 'package:bmi/screen/home_screen/widget/card_input_info.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../utils/mock_data.dart';
import '../../utils/navigation_service.dart';
import '../../utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentAge;
  late String _currentWeight;
  late String _currentHeight;
  late int _currentGender;

  @override
  void initState() {
    super.initState();
    _currentAge = getAge();
    _currentWeight = getWeight();
    _currentHeight = getHeight();
    _currentGender = getGender();
    print('TheMD $_currentGender');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenBloc>(),
      child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
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
                                    initValue: _currentWeight,
                                    textSuffix: 'kg',
                                    infoIndex: (weight) {
                                      _currentWeight = weight;
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
                                    initValue: _currentHeight,
                                    infoIndex: (height) {
                                      _currentHeight = height;
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
                                    color: maleColor,
                                    onTap: () {
                                      _currentGender = MALE;
                                      context
                                          .read<HomeScreenBloc>()
                                          .add(OnTapGender(gender: 0));
                                    },
                                    border: (_currentGender == MALE)
                                        ? BorderSide(
                                            color: maleColor, width: 3.0)
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
                                    color: femaleColor,
                                    onTap: () {
                                      _currentGender = FEMALE;
                                      context
                                          .read<HomeScreenBloc>()
                                          .add(OnTapGender(gender: 1));
                                    },
                                    border: (_currentGender == FEMALE)
                                        ? BorderSide(
                                            color: femaleColor, width: 3.0)
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
                              color: cardColor,
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
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 2),
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
                          onTap: () {
                            context.read<HomeScreenBloc>().add(CalculationBMI(
                                  age: _currentAge,
                                  gender: _currentGender,
                                  weight: _currentWeight,
                                  height: _currentHeight,
                                ));
                          },
                          borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadius),
                          ),
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
        listener: (BuildContext context, HomeScreenState state) {
          if (state is CalculationBMISuccess) {
            navService.pushNamed(RouteConstants.resultScreen, args: {
              'bmiData': state.bmiData,
              'resultBMI': state.bmi,
              'gender': _currentGender,
              'age': _currentAge,
              'history': false
            });
            saveHeight(height: _currentHeight);
            saveWeight(weight: _currentWeight);
            saveAge(age: _currentAge);
            saveGender(gender: _currentGender);
          }

          if (state is HeightValidate) {
            showCustomDialog(title: 'Oops', message: 'Height  is validate');
          }
          if (state is WeightValidate) {
            showCustomDialog(title: 'Oops', message: 'Weight is validate');
          }
          if (state is WeightAndHeightValidate) {
            showCustomDialog(
                title: 'Oops', message: 'Height and Weight is validate');
          }
        },
      ),
    );
  }

  void showCustomDialog({required String title, required String message}) {
    PanaraInfoDialog.show(
      context,
      title: title,
      color: Color(0xFFFF2323),
      message: message,
      buttonText: 'OKAY',
      panaraDialogType: PanaraDialogType.custom,
      onTapDismiss: () {
        Navigator.pop(context);
      },
      barrierDismissible: false, // optional parameter (default is true)
    );
  }
}

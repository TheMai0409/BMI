import 'package:bmi/model/bmi_data.dart';
import 'package:bmi/screen/result_screen/bloc/result_screen_bloc.dart';
import 'package:bmi/screen/result_screen/widget/text_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../component/ink_well_button.dart';
import '../../di/injection.dart';
import '../../utils/constants.dart';
import '../../utils/navigation_service.dart';
import '../../utils/routes.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  void showCustomDialog({required String title, required String message}) {
    PanaraInfoDialog.show(
      context,
      title: title,
      message: message,
      buttonText: 'OKAY',
      panaraDialogType: PanaraDialogType.success,
      onTapDismiss: () {
        navService.pushNamedAndRemoveUntil(RouteConstants.mainScreen);
      },
      barrierDismissible: false, // optional parameter (default is true)
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <dynamic, dynamic>{}) as Map;
    final bmiData = arguments['bmiData'] as BMIData;
    final double resultBMI = arguments['resultBMI'];
    final int gender = arguments['gender'];
    final int age = arguments['age'];
    final bool typeScreen = arguments['history'];

    return BlocProvider(
      create: (context) => getIt<ResultScreenBloc>(),
      child: BlocConsumer<ResultScreenBloc, ResultScreenState>(
        listener: (context, state) {
          if (state is SaveDataSuccess) {
            showCustomDialog(title: 'Success', message: 'Save success');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size(0.0, 0.0),
              child: Container(),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10,
                              left: defaultPadding,
                              right: defaultPadding),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWellButton(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                ),
                                onTap: () => {navService.goBack()},
                              ),
                              Spacer(),
                              Text(
                                "Result",
                                style: const TextStyle(
                                  fontSize: textSizeLarge,
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              SfRadialGauge(
                                animationDuration: 2000,
                                enableLoadingAnimation: true,
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    showAxisLine: false,
                                    showLabels: false,
                                    showTicks: false,
                                    startAngle: 180,
                                    endAngle: 362,
                                    radiusFactor: 0.93,
                                    labelOffset: 0,
                                    minimum: bmiData.thin3,
                                    maximum: bmiData.obesityIII,
                                    canScaleToFit: true,
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                          angle: 175,
                                          positionFactor: 0.8,
                                          widget: Text(
                                              '${bmiData.thin3.toStringAsFixed(1)}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      GaugeAnnotation(
                                          angle: 5,
                                          positionFactor: 0.8,
                                          widget: Text(
                                              '${bmiData.obesityIII.toStringAsFixed(1)}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)))
                                    ],
                                    pointers: <GaugePointer>[
                                      NeedlePointer(
                                        value: resultBMI,
                                        needleLength: 0.6,
                                        lengthUnit: GaugeSizeUnit.factor,
                                        needleStartWidth: 1,
                                        needleEndWidth: 8,
                                        animationType: AnimationType.elasticOut,
                                        enableAnimation: true,
                                        animationDuration: 1200,
                                        knobStyle: const KnobStyle(
                                            knobRadius: 0.09,
                                            sizeUnit: GaugeSizeUnit.factor,
                                            borderColor: Colors.black,
                                            color: Colors.white,
                                            borderWidth: 0.05),
                                        tailStyle: const TailStyle(
                                            color: Colors.black,
                                            width: 8,
                                            lengthUnit: GaugeSizeUnit.factor,
                                            length: 0.2),
                                        needleColor: Colors.black,
                                      )
                                    ],
                                    ranges: <GaugeRange>[
                                      GaugeRange(
                                        startValue: bmiData.thin3,
                                        endValue: bmiData.thin1End,
                                        startWidth: 0.45,
                                        endWidth: 0.45,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: thinI,
                                      ),
                                      GaugeRange(
                                        startValue: bmiData.normalStart,
                                        endValue: bmiData.normalEnd,
                                        startWidth: 0.45,
                                        endWidth: 0.45,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: normal,
                                      ),
                                      GaugeRange(
                                        startValue: bmiData.overWeightStart,
                                        endValue: bmiData.overWeightEnd,
                                        startWidth: 0.45,
                                        endWidth: 0.45,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: overWeight,
                                      ),
                                      GaugeRange(
                                        startValue: bmiData.obesityIStart,
                                        endValue: bmiData.obesityIEnd,
                                        startWidth: 0.45,
                                        endWidth: 0.45,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: obesityI,
                                      ),
                                      GaugeRange(
                                        startValue: bmiData.obesityIIStart,
                                        endValue: bmiData.obesityIIEnd,
                                        startWidth: 0.45,
                                        endWidth: 0.45,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: obesityIII,
                                      ),
                                    ],
                                  ),
                                  RadialAxis(
                                    showAxisLine: false,
                                    showLabels: false,
                                    showTicks: false,
                                    startAngle: 180,
                                    endAngle: 360,
                                    minimum: bmiData.thin3,
                                    maximum: bmiData.obesityIII,
                                    radiusFactor: 0.85,
                                    canScaleToFit: true,
                                    pointers: <GaugePointer>[
                                      MarkerPointer(
                                        markerType: MarkerType.text,
                                        text: '${bmiData.normalStart}',
                                        value: bmiData.normalStart,
                                        textStyle: GaugeTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        offsetUnit: GaugeSizeUnit.factor,
                                        markerOffset: -0.20,
                                      ),
                                      MarkerPointer(
                                        markerType: MarkerType.text,
                                        text: '${bmiData.overWeightStart}',
                                        value: bmiData.overWeightStart,
                                        textStyle: GaugeTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        offsetUnit: GaugeSizeUnit.factor,
                                        markerOffset: -0.20,
                                      ),
                                      MarkerPointer(
                                        markerType: MarkerType.text,
                                        text: '${bmiData.obesityIStart}',
                                        value: bmiData.obesityIStart,
                                        textStyle: GaugeTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        offsetUnit: GaugeSizeUnit.factor,
                                        markerOffset: -0.20,
                                      ),
                                      MarkerPointer(
                                        markerType: MarkerType.text,
                                        text: '${bmiData.obesityIIStart}',
                                        value: bmiData.obesityIIStart,
                                        textStyle: GaugeTextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        offsetUnit: GaugeSizeUnit.factor,
                                        markerOffset: -0.20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                'Your BMI is: ${resultBMI.toStringAsFixed(1)}',
                                style: TextStyle(
                                  fontSize: textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: textColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        TextInfo(
                          title: 'Extremely light weight',
                          color: thinI,
                          content: '<=${bmiData.thin3}',
                          bmi: resultBMI,
                          bmiDataStart: bmiData.thin3,
                        ),
                        TextInfo(
                          title: 'Very light weight',
                          color: thinI,
                          content:
                              '${bmiData.thin2Start} - ${bmiData.thin2End}',
                          bmi: resultBMI,
                          bmiDataStart: bmiData.thin2Start,
                          bmiDataEnd: bmiData.thin2End,
                        ),
                        TextInfo(
                          title: 'Light weight',
                          color: thinI,
                          content:
                              '${bmiData.thin1Start} - ${bmiData.thin1End}',
                          bmi: resultBMI,
                          bmiDataStart: bmiData.thin1Start,
                          bmiDataEnd: bmiData.thin1End,
                        ),
                        TextInfo(
                          title: 'Normal',
                          color: normal,
                          content:
                              '${bmiData.normalStart} - ${bmiData.normalEnd}',
                          bmi: resultBMI,
                          bmiDataStart: bmiData.normalStart,
                          bmiDataEnd: bmiData.normalEnd,
                        ),
                        TextInfo(
                          title: 'Overweight',
                          color: overWeight,
                          content:
                              '${bmiData.overWeightStart} - ${bmiData.overWeightEnd}',
                          bmi: resultBMI,
                          bmiDataStart: bmiData.overWeightStart,
                          bmiDataEnd: bmiData.overWeightEnd,
                        ),
                        TextInfo(
                          title: 'Obesity I',
                          color: obesityI,
                          content:
                              '${bmiData.obesityIStart} - ${bmiData.obesityIEnd}',
                          bmi: resultBMI,
                          bmiDataStart: bmiData.obesityIStart,
                          bmiDataEnd: bmiData.obesityIEnd,
                        ),
                        TextInfo(
                          title: 'Obesity II',
                          color: obesityII,
                          content:
                              '${bmiData.obesityIIStart} - ${bmiData.obesityIIEnd}',
                          bmi: resultBMI,
                          bmiDataStart: bmiData.obesityIIStart,
                          bmiDataEnd: bmiData.obesityIIEnd,
                        ),
                        TextInfo(
                          title: 'Obesity III',
                          color: obesityIII,
                          content: '>=${bmiData.obesityIII}',
                          bmi: resultBMI,
                          bmiDataEnd: bmiData.obesityIII,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: Divider(
                            color: Color(0xFFC2BDBD),
                            thickness: 3,
                          ),
                        ),
                        TextInfo(
                          title: 'Ideal BMI range',
                          color: normal,
                          content:
                              '${bmiData.normalStart} - ${bmiData.normalEnd}',
                          bmi: resultBMI,
                          bmiDataStart: bmiData.thin3,
                          bmiDataEnd: bmiData.obesityIII,
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: typeScreen == false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: 10.0),
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
                          context.read<ResultScreenBloc>().add(SaveDataBMI(
                              bmi: resultBMI, age: age, gender: gender))
                        },
                        child: Center(
                          child: Text(
                            'Save',
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
                ),
                Visibility(
                  visible: typeScreen == true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: 10.0),
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
                        onTap: () => {navService.goBack()},
                        child: Center(
                          child: Text(
                            'Done',
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
          );
        },
      ),
    );
  }
}

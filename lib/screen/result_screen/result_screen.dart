import 'package:bmi/model/bmi_data.dart';
import 'package:bmi/screen/result_screen/widget/text_info.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../component/ink_well_button.dart';
import '../../utils/constants.dart';
import '../../utils/navigation_service.dart';
import '../../utils/routes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <dynamic, dynamic>{}) as Map;
    final bmiData = arguments['bmiData'] as BMIData;
    final double resultBMI = arguments['resultBMI'];
    print('TheMD $bmiData');
    print('TheMD $resultBMI');
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
                        top: 10, left: defaultPadding, right: defaultPadding),
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
                              endAngle: 360,
                              interval: 6,
                              minorTicksPerInterval: 10,
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
                                        '${bmiData.thin3.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold))),
                                GaugeAnnotation(
                                    angle: 5,
                                    positionFactor: 0.8,
                                    widget: Text(
                                        '${bmiData.obesityIII.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)))
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                    needleEndWidth: 5,
                                    needleLength: 0.7,
                                    value: resultBMI,
                                    knobStyle: KnobStyle(knobRadius: 0)),
                              ],
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: bmiData.thin3,
                                  endValue: bmiData.thin1End,
                                  startWidth: 0.45,
                                  endWidth: 0.45,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  color: const Color(0xFF94A1EF),
                                ),
                                GaugeRange(
                                  startValue: bmiData.normalStart,
                                  endValue: bmiData.normalEnd,
                                  startWidth: 0.45,
                                  endWidth: 0.45,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  color: const Color(0xFF17FA00),
                                ),
                                GaugeRange(
                                  startValue: bmiData.overWeightStart,
                                  endValue: bmiData.overWeightEnd,
                                  startWidth: 0.45,
                                  endWidth: 0.45,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  color: const Color(0xFFF6C404),
                                ),
                                GaugeRange(
                                  startValue: bmiData.obesityIStart,
                                  endValue: bmiData.obesityIEnd,
                                  startWidth: 0.45,
                                  endWidth: 0.45,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  color: const Color(0xFFFD794A),
                                ),
                                GaugeRange(
                                  startValue: bmiData.obesityIIStart,
                                  endValue: bmiData.obesityIIEnd,
                                  startWidth: 0.45,
                                  endWidth: 0.45,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  color: const Color(0xFFFF4100),
                                ),
                              ],
                            ),
                            RadialAxis(
                              showAxisLine: false,
                              showLabels: false,
                              showTicks: false,
                              startAngle: 180,
                              endAngle: 360,
                              maximum: 120,
                              radiusFactor: 0.85,
                              canScaleToFit: true,
                              pointers: <GaugePointer>[],
                            ),
                          ],
                        ),
                        Text(
                          'You BMI ${resultBMI.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: textSizeMid,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xFF0827F1),
              borderRadius: BorderRadius.all(
                Radius.circular(defaultBorderRadius),
              ),
            ),
            child: InkWellButton(
              onTap: () => {navService.pushNamed(RouteConstants.resultScreen)},
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
          )
        ],
      ),
    );
  }
}


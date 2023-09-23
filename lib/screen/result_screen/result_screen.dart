import 'package:bmi/screen/result_screen/widget/text_info.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../component/ink_well_button.dart';
import '../../utils/constants.dart';
import '../../utils/navigation_service.dart';
import '../../utils/routes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      alignment: Alignment.bottomCenter,
                      children: [
                        SfRadialGauge(
                          enableLoadingAnimation: true,
                          animationDuration: 2000,
                          axes: <RadialAxis>[
                            RadialAxis(
                                showLabels: false,
                                showTicks: false,
                                showAxisLine: false,
                                centerY: 0.7,
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      angle: 90,
                                      widget: Text(
                                        '30',
                                        style: TextStyle(fontSize: 11),
                                      ))
                                ],
                                startAngle: 180,
                                endAngle: 0,
                                minimum: 0,
                                maximum: 99,
                                ranges: <GaugeRange>[
                                  GaugeRange(
                                    startValue: 0,
                                    endValue: 33,
                                    color: Color(0xFFFE2A25),
                                    label: 'Slow',
                                    sizeUnit: GaugeSizeUnit.factor,
                                    labelStyle: GaugeTextStyle(
                                        fontFamily: 'Times', fontSize: 20),
                                  ),
                                  GaugeRange(
                                    startValue: 33,
                                    endValue: 66,
                                    color: Color(0xFFFFBA00),
                                    label: 'Moderate',
                                    labelStyle: GaugeTextStyle(
                                        fontFamily: 'Times', fontSize: 20),
                                    sizeUnit: GaugeSizeUnit.factor,
                                  ),
                                  GaugeRange(
                                    startValue: 66,
                                    endValue: 99,
                                    color: Color(0xFF00AB47),
                                    label: 'Fast',
                                    labelStyle: GaugeTextStyle(
                                        fontFamily: 'Times', fontSize: 20),
                                    sizeUnit: GaugeSizeUnit.factor,
                                  ),
                                ],
                                pointers: <GaugePointer>[
                                  MarkerPointer(
                                      value: 30,
                                      enableDragging: true,
                                      markerWidth: 30,
                                      markerHeight: 30,
                                      markerOffset: -15,
                                      color: Colors.indigo)
                                ])
                          ],
                        ),
                        Text('You BMI')
                      ],
                    ),
                  ),
                  TextInfo(
                    title: 'Hello',
                    color: Colors.black12,
                    content: 'The',
                  )
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
                  'Caculation',
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

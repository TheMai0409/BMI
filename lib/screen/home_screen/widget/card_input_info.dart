import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';

class CardInputInfo extends StatelessWidget {
  final String title;
  final String textSuffix;
  final String initValue;
  final TextEditingController? controller;
  final Function(String) infoIndex;
  final Function(String?)? changeUnit;

  const CardInputInfo(
      {super.key,
      required this.title,
      required this.initValue,
      required this.textSuffix,
      this.controller,
      this.changeUnit,
      required this.infoIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.43,
      child: Card(
        elevation: 0,
        color: cardColor,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBorderRadius))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: textSizeSmall,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: IntrinsicWidth(
                  child: TextFormField(
                    maxLines: 1,
                    initialValue: initValue,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: controller,
                    onChanged: infoIndex,
                    maxLength: 5,
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      counterText: '',
                      suffixText: ' $textSuffix',
                      suffixStyle: const TextStyle(
                        color: textColor,
                        fontSize: textSizeUnit,
                      ),
                    ),
                    style: const TextStyle(
                      color: textColor,
                      fontSize: textSizeLarge,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

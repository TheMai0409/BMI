import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';

class CardInputInfo extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final Function(String) infoIndex;
  final Function(String?)? changeUnit;

  const CardInputInfo(
      {super.key,
      required this.title,
      this.controller,
      this.changeUnit,
      required this.infoIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.43,
      child: Card(
        elevation: 0,
        color: const Color(0xFFEFEFEF),
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
                  title!,
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicWidth(
                      child: TextField(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: controller,
                        onChanged: infoIndex,
                        maxLength: 5,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          counterText: '',
                        ),
                        style: const TextStyle(
                          color: textColor,
                          fontSize: textSizeLarge,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'cm',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

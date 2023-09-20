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
    return Column(
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Card(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: controller,
                  onChanged: infoIndex,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('cm')),
              )
            ],
          ),
        )
      ],
    );
  }
}

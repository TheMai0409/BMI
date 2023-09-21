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
      height: MediaQuery.of(context).size.width / 3,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: TextField(
                      maxLines: 1,
                      controller: controller,
                      onChanged: infoIndex,
                      maxLength: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        counterText: '',
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: Center(child: Text('cm')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

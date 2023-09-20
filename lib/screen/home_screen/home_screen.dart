import 'dart:developer';

import 'package:bmi/screen/home_screen/widget/card_input_info.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CardInputInfo(
                  title: 'Weight',
                  infoIndex: (height) {
                    log('Height $height');
                  },
                ),
              ),
              Expanded(
                child: CardInputInfo(
                  title: 'Height',
                  infoIndex: (height) {
                    log('Height $height');
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

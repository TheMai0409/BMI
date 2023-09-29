import 'dart:math';

import 'package:flutter/material.dart';

bool checkYourBMI({
  required double bmi,
  double? bmiDataStart,
  double? bmiDataEnd,
}) {
  bool isSelect = false;
  if (bmiDataEnd != null && bmiDataStart != null) {
    if (bmi >= bmiDataStart && bmi <= bmiDataEnd) {
      isSelect = true;
    } else {
      isSelect = false;
    }
  }
  if (bmiDataStart != null && bmiDataEnd == null) {
    if (bmi <= bmiDataStart) {
      isSelect = true;
    }
  }
  if (bmiDataEnd != null && bmiDataStart == null) {
    if (bmi >= bmiDataEnd) {
      isSelect = true;
    }
  }
  return isSelect;
}

int randomNumber() {
  var rng = Random();
  var randomNumber = 0 + rng.nextInt(200000);
  return randomNumber;
}



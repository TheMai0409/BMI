class BMIData {
  final int age;
  final double thin3;
  final double thin2Start;
  final double thin2End;
  final double thin1Start;
  final double thin1End;
  final double normalStart;
  final double normalEnd;
  final double overWeightStart;
  final double overWeightEnd;
  final double obesityIStart;
  final double obesityIEnd;
  final double obesityIIStart;
  final double obesityIIEnd;
  final double obesityIII;

  BMIData({
    required this.age,
    required this.thin3,
    required this.thin2Start,
    required this.thin2End,
    required this.thin1Start,
    required this.thin1End,
    required this.normalStart,
    required this.normalEnd,
    required this.overWeightStart,
    required this.overWeightEnd,
    required this.obesityIStart,
    required this.obesityIEnd,
    required this.obesityIIStart,
    required this.obesityIIEnd,
    required this.obesityIII,
  });

  @override
  String toString() {
    return 'BMIData{age: $age, thin3: $thin3, thin2Start: $thin2Start, thin2End: $thin2End, thin1Start: $thin1Start, thin1End: $thin1End, normalStart: $normalStart, normalEnd: $normalEnd, overWeightStart: $overWeightStart, overWeightEnd: $overWeightEnd, obesityIStart: $obesityIStart, obesityIEnd: $obesityIEnd, obesityIIStart: $obesityIIStart, obesityIIEnd: $obesityIIEnd, obesityIII: $obesityIII}';
  }
}

import 'package:hive_flutter/hive_flutter.dart';


part 'user_bmi.g.dart';
@HiveType(typeId: 0)
class UserBMI {
  @HiveField(0)
  String? dateTime;
  @HiveField(1)
  double? bmi;
  @HiveField(2)
  int? age;
  @HiveField(3)
  int? gender;

  UserBMI({this.dateTime, this.bmi, this.age, this.gender});

  @override
  String toString() {
    return 'UserBMI{dateTime: $dateTime, bmi: $bmi, age: $age, gender: $gender}';
  }
}

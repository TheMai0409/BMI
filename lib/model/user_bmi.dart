import 'package:hive_flutter/hive_flutter.dart';

part 'user_bmi.g.dart';
@HiveType(typeId: 0)
class UserBMI {
  @HiveField(0)
  double? height;
  @HiveField(1)
  double? weight;
  @HiveField(2)
  DateTime? dateTime;

  UserBMI({this.height, this.weight, this.dateTime});
}

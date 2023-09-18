import 'package:bmi/model/user_bmi.dart';
import 'package:hive_flutter/adapters.dart';

final box = Hive.box('BMIAppBox');

Future<dynamic> openBox() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserBMIAdapter());
  return Hive.openBox('BMIAppBox');
}

List<UserBMI> getUserBMI() {
  return box.get('UserBMI');
}

void saveUserBMI({required UserBMI user}) {
  box.put('UserBMI', user);
}

void deleteUserBMI() {
  box.delete('UserBMI');
}

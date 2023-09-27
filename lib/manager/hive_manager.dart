import 'package:bmi/model/user_bmi.dart';
import 'package:hive_flutter/adapters.dart';

import '../utils/mock_data.dart';

final box = Hive.box('BMIAppBox');

Future<dynamic> openBox() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserBMIAdapter());
  return Hive.openBox('BMIAppBox');
}

List<UserBMI> getListBMI() {
  return box.get('ListBMI', defaultValue: <UserBMI>[]).cast<UserBMI>();
}

void saveListBMI({required List<UserBMI> users}) {
  box.put('ListBMI', users);
}

void deleteUserBMI() {
  box.delete('ListBMI');
}

String getHeight() {
  return box.get('Height', defaultValue: '0.0');
}

void saveHeight({required String height}) {
  box.put('Height', height);
}

String getWeight() {
  return box.get('Weight', defaultValue: '0.0');
}

void saveWeight({required String weight}) {
  box.put('Weight', weight);
}

int getAge() {
  return box.get('Age', defaultValue: 1);
}

void saveAge({required int age}) {
  box.put('Age', age);
}

dynamic getGender() {
  return box.get('Gender', defaultValue: MALE);
}

void saveGender({required dynamic gender}) {
  box.put('Gender', gender);
}

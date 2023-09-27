import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/history_screen/widget/item_bmi.dart';
import 'package:flutter/material.dart';

import '../../component/custom_app_bar.dart';
import '../../model/user_bmi.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<UserBMI>? lists;

  @override
  void initState() {
    lists = getListBMI();
    print('TheMD ${lists!.length >= 1}');
    print('TheMD Lists ${lists}');
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0.0, 0.0),
        child: Container(),
      ),
      body: lists!.isNotEmpty
          ? SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAppBar(
                    title: 'History',
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemBmi(item: lists![index]);
                    },
                    itemCount: lists!.length,
                  )
                ],
              ),
            )
          : Column(
              children: [
                CustomAppBar(
                  title: 'History',
                ),
                Spacer(),
                Text('No history yet'),
                Spacer()
              ],
            ),
    );
  }
}

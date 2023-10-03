import 'package:bmi/di/injection.dart';
import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/history_screen/widget/item_bmi.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/custom_app_bar.dart';
import '../../model/user_bmi.dart';
import '../../utils/navigation_service.dart';
import '../../utils/routes.dart';
import 'bloc/history_screen_bloc.dart';

class HistoryScreen extends StatefulWidget {
  final VoidCallback goToSettingScreen;

  const HistoryScreen({super.key, required this.goToSettingScreen});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<UserBMI>? lists;

  @override
  void initState() {
    lists = getListBMI();
    super.initState();
  }
  @override
  void didUpdateWidget(covariant HistoryScreen oldWidget) {
    lists = getListBMI();
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HistoryScreenBloc>(),
      child: BlocConsumer<HistoryScreenBloc, HistoryScreenState>(
        listener: (context, state) {
          if (state is OnSelectItem) {
            navService.pushNamed(RouteConstants.resultScreen, args: {
              'bmiData': state.data,
              'resultBMI': state.userBMI.bmi,
              'gender': state.userBMI.gender,
              'age': state.userBMI.age,
              'history': true
            });
          }
          if (state is DeleteSuccess) {
            lists = state.lists;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size(0.0, 0.0),
              child: Container(),
            ),
            body: lists!.isNotEmpty
                ? SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomAppBar(
                          title: 'history'.tr(),
                          goToScreen: widget.goToSettingScreen,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ItemBmi(
                              item: lists![index],
                              onDelete: () {
                                context.read<HistoryScreenBloc>().add(
                                    RemoveItemBMI(
                                        lists: lists!, data: lists![index]));
                              },
                              onTap: () {
                                context
                                    .read<HistoryScreenBloc>()
                                    .add(SelectBMI(data: lists![index]));
                              },
                            );
                          },
                          itemCount: lists!.length,
                        )
                      ],
                    ),
                  )
                : Column(
                    children: [
                      CustomAppBar(
                        title: 'history'.tr(),
                        goToScreen: widget.goToSettingScreen,
                      ),
                      const Spacer(),
                      Text(
                        'no_history'.tr(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
          );
        },
      ),
    );
  }
}

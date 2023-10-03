import 'package:bmi/component/ink_well_button.dart';
import 'package:bmi/model/user_bmi.dart';
import 'package:bmi/utils/constants.dart';
import 'package:bmi/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemBmi extends StatelessWidget {
  final UserBMI item;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const ItemBmi(
      {super.key,
      required this.item,
      required this.onDelete,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: 10),
        child: Slidable(
          key: ValueKey(randomNumber()),
          closeOnScroll: true,
          endActionPane: ActionPane(
            extentRatio: 0.3,
            dismissible: null,
            motion: const DrawerMotion(),
            children: [
              //
              // SlidableAction(
              //   onPressed: null,
              //   backgroundColor: Colors.red,
              //   foregroundColor: Colors.white,
              //   icon: Icons.delete,
              //   label: 'Delete',
              // ),
              Expanded(
                child: InkWellButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFFC4C4),
                            Color(0xFFFFD8D8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Icon(
                        Icons.delete_rounded,
                        color: Color(0xFFFF0000),
                      ),
                    ),
                  ),
                  onTap: () {
                    onDelete();
                  },
                ),
              )
            ],
          ),
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                SizedBox(
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMI: ${item.bmi!.toStringAsFixed(1)}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${'date_time'.tr()}: ${item.dateTime}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                    height: double.infinity,
                    width: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xFFEFEFEF),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

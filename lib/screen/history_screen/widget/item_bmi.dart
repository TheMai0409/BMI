import 'package:bmi/model/user_bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemBmi extends StatelessWidget {
  final UserBMI item;

  const ItemBmi({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          dismissible: DismissiblePane(onDismissed: () {

          }),
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              flex: 1,
              onPressed: (value) {

              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),

          ],
        ),
        child: Container(
          color: Colors.yellow,
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 50,
          child: Center(
              child: Text(
                '${item.bmi!.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
        ),
      ),
    );
  }
}

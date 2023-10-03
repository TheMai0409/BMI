import 'package:bmi/model/article.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemPageView extends StatefulWidget {
  final Article article;

  const ItemPageView({super.key, required this.article});

  @override
  State<ItemPageView> createState() => _ItemPageViewState();
}

class _ItemPageViewState extends State<ItemPageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text(widget.article.title ?? '', style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.w500),),
              SizedBox(height: 25,),
              Text(widget.article.content ?? '', style: TextStyle(color: textColor, fontSize: 18, height: 1.5),),
            ],
          ),
        ),
      ),
    );
  }
}

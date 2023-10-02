import 'package:bmi/model/article.dart';
import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemPageView extends StatelessWidget {
  final Article article;

  const ItemPageView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(article.title ?? '', style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.w500),),
              SizedBox(height: 40,),
              Text(article.content ?? '', style: TextStyle(color: textColor, fontSize: 18, height: 1.5),),
            ],
          ),
        ),
      ),
    );
  }
}

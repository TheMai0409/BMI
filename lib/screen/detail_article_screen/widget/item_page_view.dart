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
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Text(widget.article.title ?? '', style: const TextStyle(color: textColor, fontSize: textSizeMid, fontWeight: FontWeight.w500),),
              const SizedBox(height: 25,),
              Text(widget.article.content ?? '', style: const TextStyle(color: textColor, fontSize: textSizeSmall, height: 1.6),),
            ],
          ),
        ),
      ),
    );
  }
}

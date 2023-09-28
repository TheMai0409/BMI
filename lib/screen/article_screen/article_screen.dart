import 'package:bmi/screen/article_screen/widget/item_article.dart';
import 'package:flutter/material.dart';

import '../../component/custom_app_bar.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0.0, 0.0),
        child: Container(),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Article',
              ),
              const SizedBox(
                height: 60,
              ),
              ItemArticle(title: 'Hello', isLove: true),
              ItemArticle(title: 'Hello', isLove: true),
              ItemArticle(title: 'Hello', isLove: true),
              ItemArticle(title: 'Hello', isLove: true),
              ItemArticle(title: 'Hello', isLove: true),
              ItemArticle(title: 'Hello', isLove: true),
              ItemArticle(title: 'Hello', isLove: true),
            ],
          ),
        ),
      ),
    );
  }
}

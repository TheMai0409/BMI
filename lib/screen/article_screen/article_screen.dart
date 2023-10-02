import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/article_screen/widget/item_article.dart';
import 'package:bmi/utils/mock_data.dart';
import 'package:bmi/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../component/custom_app_bar.dart';
import '../../utils/routes.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late bool _isLove1, _isLove2, _isLove3, _isLove4;

  @override
  void initState() {
    _isLove1 = getArticles1();
    _isLove2 = getArticles2();
    _isLove3 = getArticles3();
    _isLove4 = getArticles4();

    super.initState();
  }

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
               CustomAppBar(
                title: 'article'.tr(),
              ),
              const SizedBox(
                height: 50,
              ),
              ItemArticle(
                title: 'article1_title1'.tr(),
                isLove: _isLove1,
                onLikeButtonTapped: onLikeButton1Tapped,
                opTap: () {
                  navService.pushNamed(RouteConstants.detailArticleScreen, args: {
                    'articles': article1
                  });
                },
              ),
              ItemArticle(
                title: 'article2_title1'.tr(),
                isLove: _isLove2,
                onLikeButtonTapped: onLikeButton2Tapped,
                opTap: () {
                  navService.pushNamed(RouteConstants.detailArticleScreen, args: {
                    'articles': article2
                  });
                },
              ),
              ItemArticle(
                title: 'article3_title1'.tr(),
                isLove: _isLove3,
                onLikeButtonTapped: onLikeButton3Tapped,
                opTap: () {
                  navService.pushNamed(RouteConstants.detailArticleScreen, args: {
                    'articles': article3
                  });
                },
              ),
              ItemArticle(
                title: 'article4_title1'.tr(),
                isLove: _isLove4,
                onLikeButtonTapped: onLikeButton4Tapped,
                opTap: () {
                  navService.pushNamed(RouteConstants.detailArticleScreen, args: {
                    'articles': article4
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onLikeButton1Tapped(bool isLiked) async {
    saveArticles1(love: !isLiked);
    return !isLiked;
  }

  Future<bool> onLikeButton2Tapped(bool isLiked) async {
    saveArticles2(love: !isLiked);
    return !isLiked;
  }

  Future<bool> onLikeButton3Tapped(bool isLiked) async {
    saveArticles3(love: !isLiked);
    return !isLiked;
  }

  Future<bool> onLikeButton4Tapped(bool isLiked) async {
    saveArticles4(love: !isLiked);
    return !isLiked;
  }
}

import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/article_screen/widget/item_article.dart';
import 'package:bmi/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../component/custom_app_bar.dart';
import '../../model/article.dart';
import '../../utils/routes.dart';

class ArticleScreen extends StatefulWidget {
  final VoidCallback goToSettingScreen;

  const ArticleScreen({super.key, required this.goToSettingScreen});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late bool _isLove1, _isLove2, _isLove3, _isLove4;
  late List<Article> _article1, _article2, _article3, _article4;

  @override
  void initState() {
    _isLove1 = getArticles1();
    _isLove2 = getArticles2();
    _isLove3 = getArticles3();
    _isLove4 = getArticles4();

    super.initState();
  }
  @override
  void didUpdateWidget(covariant ArticleScreen oldWidget) {
    _article1 = [
      Article(
        title: 'article1_title1'.tr(),
        content: 'article1_content1'.tr(),
      ),
      Article(
        title: 'article1_title2'.tr(),
        content: 'article1_content2'.tr(),
      ),
      Article(
        title: 'article1_title3'.tr(),
        content: 'article1_content3'.tr(),
      ),
      Article(
        title: 'article1_title4'.tr(),
        content: 'article1_content4'.tr(),
      ),
      Article(
        title: 'article1_title5'.tr(),
        content: 'article1_content5'.tr(),
      ),
      Article(
        title: 'article1_title6'.tr(),
        content: 'article1_content6'.tr(),
      )
    ];

    _article2 = [
      Article(
        title: 'article2_title1'.tr(),
        content: 'article2_content1'.tr(),
      ),
      Article(
        title: 'article2_title2'.tr(),
        content: 'article2_content2'.tr(),
      ),
      Article(
        title: 'article2_title3'.tr(),
        content: 'article2_content3'.tr(),
      ),
      Article(
        title: 'article2_title4'.tr(),
        content: 'article2_content4'.tr(),
      ),
      Article(
        title: 'article2_title5'.tr(),
        content: 'article2_content5'.tr(),
      ),
      Article(
        title: 'article2_title6'.tr(),
        content: 'article2_content6'.tr(),
      ),
      Article(
        title: 'article2_title7'.tr(),
        content: 'article2_content7'.tr(),
      )
    ];

    _article3 = [
      Article(
        title: 'article3_title1'.tr(),
        content: 'article3_content1'.tr(),
      ),
      Article(
        title: 'article3_title2'.tr(),
        content: 'article3_content2'.tr(),
      ),
      Article(
        title: 'article3_title3'.tr(),
        content: 'article3_content3'.tr(),
      ),
      Article(
        title: 'article3_title4'.tr(),
        content: 'article3_content4'.tr(),
      ),
      Article(
        title: 'article3_title5'.tr(),
        content: 'article3_content5'.tr(),
      ),
      Article(
        title: 'article3_title6'.tr(),
        content: 'article3_content6'.tr(),
      ),
      Article(
        title: 'article3_title7'.tr(),
        content: 'article3_content7'.tr(),
      ),
      Article(
        title: 'article3_title8'.tr(),
        content: 'article3_content8'.tr(),
      )
    ];

    _article4 = [
      Article(
        title: 'article4_title1'.tr(),
        content: 'article4_content1'.tr(),
      ),
      Article(
        title: 'article4_title2'.tr(),
        content: 'article4_content2'.tr(),
      ),
      Article(
        title: 'article4_title3'.tr(),
        content: 'article4_content3'.tr(),
      )
    ];
    super.didUpdateWidget(oldWidget);
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
                goToScreen: widget.goToSettingScreen,
              ),
              const SizedBox(
                height: 50,
              ),
              ItemArticle(
                title: 'article1_title1'.tr(),
                isLove: _isLove1,
                onLikeButtonTapped: onLikeButton1Tapped,
                opTap: () {
                  navService.pushNamed(RouteConstants.detailArticleScreen,
                      args: {'articles': _article1});
                },
              ),
              ItemArticle(
                title: 'article2_title1'.tr(),
                isLove: _isLove2,
                onLikeButtonTapped: onLikeButton2Tapped,
                opTap: () {
                  navService.pushNamed(RouteConstants.detailArticleScreen,
                      args: {'articles': _article2});
                },
              ),
              ItemArticle(
                title: 'article3_title1'.tr(),
                isLove: _isLove3,
                onLikeButtonTapped: onLikeButton3Tapped,
                opTap: () {
                  navService.pushNamed(RouteConstants.detailArticleScreen,
                      args: {'articles': _article3});
                },
              ),
              ItemArticle(
                title: 'article4_title1'.tr(),
                isLove: _isLove4,
                onLikeButtonTapped: onLikeButton4Tapped,
                opTap: () {
                  navService.pushNamed(RouteConstants.detailArticleScreen,
                      args: {'articles': _article4});
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

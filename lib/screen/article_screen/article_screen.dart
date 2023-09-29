import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/screen/article_screen/widget/item_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../component/custom_app_bar.dart';

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
  Future<AppLocalizations> get l10n {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    final preferred = widgetsBinding.window.locales;
    const supported = AppLocalizations.supportedLocales;
    final locale = basicLocaleListResolution(preferred, supported);
    return AppLocalizations.delegate.load(locale);
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
              const CustomAppBar(
                title: 'Article',
              ),
              const SizedBox(
                height: 50,
              ),
              ItemArticle(
                title: 'Hello',
                isLove: _isLove1,
                onLikeButtonTapped: onLikeButton1Tapped,
              ),
              ItemArticle(
                title: 'Hello',
                isLove: _isLove2,
                onLikeButtonTapped: onLikeButton2Tapped,
              ),
              ItemArticle(
                title: 'Hello',
                isLove: _isLove3,
                onLikeButtonTapped: onLikeButton3Tapped,
              ),
              ItemArticle(
                title: 'Hello',
                isLove: _isLove4,
                onLikeButtonTapped: onLikeButton4Tapped,
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

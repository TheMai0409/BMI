import 'package:bmi/screen/detail_article_screen/widget/item_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../component/ink_well_button.dart';
import '../../model/article.dart';
import '../../utils/constants.dart';
import '../../utils/navigation_service.dart';

class DetailArticleScreen extends StatefulWidget {
  const DetailArticleScreen({super.key});

  @override
  State<DetailArticleScreen> createState() => _DetailArticleScreenState();
}

class _DetailArticleScreenState extends State<DetailArticleScreen> {
  late int selectedPage;
  late final PageController _pageController;
  late final List<Article> articles;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <dynamic, dynamic>{}) as Map;
    final articles = arguments['articles'] as List<Article>;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 10,
                    left: defaultPadding,
                    right: defaultPadding),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWellButton(

                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 28,
                      ),
                      onTap: () => {navService.goBack()},
                    ),

                    Flexible(
                      child: Text(
                        '${articles[0].title}',
                        style: const TextStyle(
                          fontSize: textSizeSmall,
                          color: textColor,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      selectedPage = page;
                    });
                  },
                  children: List.generate(articles.length, (index) {
                    return ItemPageView(
                      article: articles[index],
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: DotsIndicator(
                  dotsCount: articles.length,
                  position: selectedPage,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),

    );
  }
}

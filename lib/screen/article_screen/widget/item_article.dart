import 'package:bmi/component/ink_well_button.dart';
import 'package:bmi/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ItemArticle extends StatelessWidget {
  final String title;
  final bool isLove;
  final Future<bool> Function(bool) onLikeButtonTapped;
  final VoidCallback opTap;

  const ItemArticle({
    super.key,
    required this.title,
    required this.isLove,
    required this.onLikeButtonTapped,
    required this.opTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      borderRadius: BorderRadius.all(
        Radius.circular(18.0),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 10),
        elevation: 0,
        color: const Color(0xFFEFEFEF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'time_read'.tr(),
                    style: TextStyle(color: Colors.black54),
                  ),
                  LikeButton(
                    size: 23,
                    isLiked: isLove,
                    circleColor: CircleColor(
                        start: Color(0xffef3c3c), end: Color(0xfffc0000)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xffe54949),
                      dotSecondaryColor: Color(0xffe70808),
                    ),
                    onTap: onLikeButtonTapped,
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Color(0xffff0101) : Color(0xff706f6f),
                        size: 23,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
      onTap: opTap,
    );
  }
}

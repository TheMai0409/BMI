import 'package:bmi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ItemArticle extends StatelessWidget {
  final String title;
  final bool isLove;
  final Function(bool?)? onLove;

  const ItemArticle(
      {super.key, required this.title, required this.isLove, this.onLove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 10),
      elevation: 0,
      color: const Color(0xFFEFEFEF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: textSizeMid,
                color: textColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('3-minutute read'),
                LikeButton(
                  size: 23,
                  isLiked: isLove,
                  circleColor: CircleColor(
                      start: Color(0xffef3c3c), end: Color(0xfffc0000)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xffe54949),
                    dotSecondaryColor: Color(0xffe70808),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Color(0xffff0101) : Color(0xff706f6f),
                      size: 23,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

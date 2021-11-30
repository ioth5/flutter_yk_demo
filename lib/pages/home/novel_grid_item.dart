import 'package:flutter/material.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/widget/novel_cover_image.dart';

import 'home_model.dart';

class NovelGridItem extends StatelessWidget {
  final RecmdsData recmdsData;
  NovelGridItem(this.recmdsData);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15 * 2 - 15) / 2;
    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNovelDetail(context, this.novel);
      },
      child: Container(
        width: width,
        child: Row(
          children: <Widget>[
            NovelCoverImage(
              recmdsData.cover,
              width: 40,
              height: 53,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    recmdsData.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    recmdsData.author_name,
                    style: TextStyle(fontSize: 12, color: SQColor.gray),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

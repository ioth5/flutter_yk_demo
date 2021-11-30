import 'package:flutter/material.dart';
import 'package:yk_demo/pages/home/home_model.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/widget/novel_cover_image.dart';

class HomeNovelCoverView extends StatelessWidget {
  final RecmdsData recmdsData;
  HomeNovelCoverView(this.recmdsData);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15 * 2 - 15 * 3) / 4;
    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNovelDetail(context, novel);
      },
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NovelCoverImage(recmdsData.cover,
                width: width, height: width / 0.75),
            SizedBox(height: 5),
            Text(
              recmdsData.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            SizedBox(height: 3),
            Text(
              recmdsData.author_name,
              style: TextStyle(fontSize: 12, color: SQColor.gray),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

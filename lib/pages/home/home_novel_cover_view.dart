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
        Routes.navigateTo(context, Routes.novelDetailPage,
            transition: TransitionType.native,
            params: {
              'novelid': recmdsData.novel_id.toString(),
            });
      },
      child: Container(
        width: width,
        // margin: const EdgeInsets.only(right: 8),
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
          ],
        ),
      ),
    );
  }
}

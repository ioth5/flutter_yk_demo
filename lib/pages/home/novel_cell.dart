import 'package:flutter/material.dart';
import 'package:yk_demo/pages/home/home_model.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/widget/novel_cover_image.dart';

class NovelCell extends StatelessWidget {
  final RecmdsData recmdsData;
  NovelCell(this.recmdsData);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNovelDetail(context, novel);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NovelCoverImage(recmdsData.cover, width: 70, height: 93),
            SizedBox(width: 15),
            Expanded(
              child: buildRight(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          recmdsData.title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          recmdsData.desc,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: SQColor.gray,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              recmdsData.author_name,
              style: TextStyle(fontSize: 14, color: SQColor.gray),
            ),
            Expanded(child: Container()),
            // buildTag(novel.status, novel.statusColor()),
            SizedBox(width: 5),
            // buildTag(novel.type, SQColor.gray),
          ],
        )
      ],
    );
  }

  Widget buildTag(String title, Color color) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 2, 5, 3),
      decoration: BoxDecoration(
        border: Border.all(
            color: Color.fromARGB(99, color.red, color.green, color.blue),
            width: 0.5),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 11, color: color),
      ),
    );
  }
}

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
            NovelCoverImage(recmdsData.cover, width: 80, height: 106),
            SizedBox(width: 16),
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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        ),
        SizedBox(height: 0),
        buildTags(),
        SizedBox(height: 5),
        Text(
          recmdsData.desc,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13, color: SQColor.gray),
        ),
      ],
    );
  }

  Widget buildTags() {
    var tags = recmdsData.tags;

    if (tags == null) {
      return Container();
    }

    List<TagInfo> tag = [];
    tags.forEach((novel) {
      tag.add(TagInfo.fromJson(novel));
    });

    var tagWidgets = tag.map((tag) {
      var tagWidget = Container(
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(253, 120, 150, 1), width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
        child: Text(
          tag.name,
          style: TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(253, 120, 150, 1),
          ),
        ),
      );
      return tagWidget;
    }).toList();
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
      color: SQColor.white,
      child: Wrap(runSpacing: 10, spacing: 10, children: tagWidgets),
    );
  }
}

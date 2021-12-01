import 'package:flutter/material.dart';

import 'novel_grid_item.dart';
import 'home_section_view.dart';
import 'home_novel_cover_view.dart';
import 'home_model.dart';

class NovelSecondHybirdCard extends StatelessWidget {
  final Recmds recmds;

  NovelSecondHybirdCard(this.recmds);

  @override
  Widget build(BuildContext context) {
    var recmd = recmds.recmdsData;
    if (recmd == null) {
      return Container();
    }

    var topNovels = recmd.sublist(0, 4);
    List<Widget> children = [];
    topNovels.forEach((novel) {
      children.add(HomeNovelCoverView(novel));
    });

    var bottomNovels = recmd.sublist(4);
    bottomNovels.forEach((novel) {
      children.add(NovelGridItem(novel));
    });

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          HomeSectionView(recmds.name),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15, runSpacing: 15, children: children),
          ),
          Container(
            height: 10,
            color: Color(0xfff5f5f5),
          )
        ],
      ),
    );
  }
}

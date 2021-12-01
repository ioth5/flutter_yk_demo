import 'package:flutter/material.dart';

import 'home_model.dart';
import 'home_section_view.dart';
import 'home_novel_cover_view.dart';

class NovelFourGridView extends StatelessWidget {
  final Recmds recmds;

  NovelFourGridView(this.recmds);

  @override
  Widget build(BuildContext context) {
    var recmd = recmds.recmdsData;
    if (recmd == null) {
      return Container();
    }
    var children = recmd.map((novel) => HomeNovelCoverView(novel)).toList();

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeSectionView(recmds.name),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15, runSpacing: 20, children: children),
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

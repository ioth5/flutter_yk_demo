import 'package:flutter/material.dart';

import 'home_scroll_view.dart';
import 'novel_cell.dart';
import 'home_section_view.dart';
import 'home_model.dart';

class NovelFirstHybirdCard extends StatelessWidget {
  final Recmds recmds;

  NovelFirstHybirdCard(this.recmds);

  @override
  Widget build(BuildContext context) {
    var recmd = recmds.recmdsData;
    if (recmd == null) {
      return Container();
    }

    List<Widget> children = [];
    var bottomNovels = recmd.sublist(1);
    bottomNovels.forEach((novel) {
      children.add(HomeScrollView(novel));
    });

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          HomeSectionView(recmds.name),
          NovelCell(recmd[0]),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            scrollDirection: Axis.horizontal,
            child: Row(children: children),
            // child: Wrap(spacing: 15, runSpacing: 15, children: children),
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

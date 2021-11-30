import 'package:flutter/material.dart';

import 'novel_cell.dart';
import 'novel_grid_item.dart';
import 'home_section_view.dart';
import 'home_model.dart';

class NovelFirstHybirdCard extends StatelessWidget {
  final Recmds recmds;

  NovelFirstHybirdCard(this.recmds);

  @override
  Widget build(BuildContext context) {
    var recmd = recmds.recmdsData;
    if (recmd.length == 0) {
      return Container();
    }

    List<Widget> children = [];
    var bottomNovels = recmd.sublist(1);
    bottomNovels.forEach((novel) {
      children.add(NovelGridItem(novel));
    });

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          HomeSectionView(recmds.name),
          NovelCell(recmd[0]),
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

import 'package:flutter/material.dart';

import 'home_model.dart';
import 'novel_cell.dart';
import 'home_section_view.dart';

class NovelNormalCard extends StatelessWidget {
  final Recmds recmds;

  NovelNormalCard(this.recmds);

  @override
  Widget build(BuildContext context) {
    var recmd = recmds.recmdsData;
    if (recmd.length < 3) {
      return null;
    }

    List<Widget> children = [
      HomeSectionView(recmds.name),
    ];
    for (var i = 0; i < recmd.length; i++) {
      var novel = recmd[i];
      children.add(NovelCell(novel));
      children.add(Divider(height: 1));
    }
    children.add(Container(height: 10, color: Color(0xfff5f5f5)));

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

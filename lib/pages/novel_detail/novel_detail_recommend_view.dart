import 'package:flutter/material.dart';
import 'package:yk_demo/model/novel.dart';
import 'package:yk_demo/public.dart';

class NovelDetailRecommendView extends StatelessWidget {
  final List<Novel> novels;

  NovelDetailRecommendView(this.novels);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: <Widget>[
                Image.asset(Constant.ASSETS_IMG + 'home_tip.png'),
                SizedBox(width: 13),
                Text('看过本书的人还在看', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

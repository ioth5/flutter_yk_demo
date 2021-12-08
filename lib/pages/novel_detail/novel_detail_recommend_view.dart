import 'package:flutter/material.dart';
import 'package:yk_demo/model/novel.dart';

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
                SizedBox(width: 4),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: 3,
                  height: 13,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(253, 120, 150, 1),
                        Color.fromRGBO(235, 129, 181, 1),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Text('同类热书', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:yk_demo/model/novel.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/utility.dart';
import 'package:yk_demo/widget/novel_cover_image.dart';

class NovelDetailHeader extends StatelessWidget {
  final NovelInfo novelInfo;
  NovelDetailHeader(this.novelInfo);

  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var height = 415.0 + Screen.topSafeHeight;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Container(color: Color(0xbbffffff), width: width, height: height),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildTags() {
    var tags = ['纯情', '青春', '爱情'];
    var tagWidgets = tags.map((tag) {
      var tagWidget = Container(
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(253, 120, 150, 1), width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
        child: Text(
          tag,
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

  Widget buildContent(BuildContext context) {
    var width = Screen.width;
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(15, 54 + Screen.topSafeHeight, 10, 0),
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Container(
            width: 110,
            height: 146,
            decoration: BoxDecoration(
              color: Colors.white, // 底色
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(237, 237, 237, 0.9),
                    offset: Offset(2.0, 3.0),
                    blurRadius: 7.0,
                    spreadRadius: 2.0),
              ],
              borderRadius: BorderRadius.circular(7), // 圆角也可控件一边圆角大小
            ),
            child: NovelCoverImage(novelInfo.cover, width: 110, height: 146),
          ),
          SizedBox(height: 10),
          Text(
            novelInfo.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: fixedFontSize(18),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          buildTags(),
          Text(
            novelInfo.author_name +
                ' / ' +
                (novelInfo.is_end ? '已完结' : '未完结') +
                ' / ' +
                '40万字',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: fixedFontSize(13),
              color: Color.fromRGBO(102, 102, 102, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: width - 30,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white, // 底色
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(237, 237, 237, 0.9),
                    offset: Offset(2.0, 3.0),
                    blurRadius: 7.0,
                    spreadRadius: 2.0),
              ],
              borderRadius: BorderRadius.circular(7), // 圆角也可控件一边圆角大小
              //borderRadius: BorderRadius.only(
              //  topRight: Radius.circular(10),
              // bottomRight: Radius.circular(10)) //单独加某一边圆角
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Material(
                    //水波纹按压效果
                    color: Colors.white,
                    child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 4),
                            child: Text(
                              novelInfo.star_num.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Constant.ASSETS_IMG +
                                      "novel_detail_collect.png",
                                  width: 12,
                                  height: 12,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '收藏',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(101, 101, 101, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        print("点击关注");
                      },
                    ),
                  ),
                  flex: 1,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: 2,
                  height: 19,
                  decoration: ShapeDecoration(
                      color: Color.fromRGBO(242, 241, 241, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                ),
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 4),
                            child: Text(
                              novelInfo.hot_num.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Constant.ASSETS_IMG +
                                      "novel_detail_renqi.png",
                                  width: 12,
                                  height: 12,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '人气',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(101, 101, 101, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        print("点击关注");
                      },
                    ),
                  ),
                  flex: 1,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: 2,
                  height: 19,
                  decoration: ShapeDecoration(
                      color: Color.fromRGBO(242, 241, 241, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 16, bottom: 4),
                        child: Text(
                          novelInfo.score.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Constant.ASSETS_IMG + "novel_detail_score.png",
                              width: 12,
                              height: 12,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '评分',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(101, 101, 101, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

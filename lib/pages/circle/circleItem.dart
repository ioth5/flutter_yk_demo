import 'package:flutter/material.dart';
import 'package:yk_demo/pages/circle/view_pic.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/widget/novel_cover_image.dart';

import 'circle_model.dart';

class CircleItem extends StatelessWidget {
  final CircleModel circleItem;

  CircleItem(this.circleItem);

  @override
  Widget build(BuildContext context) {
    var isDetail = false;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _authorRow(context, circleItem),
          textContent(circleItem.content, context, isDetail),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                NinePicture(circleItem.pic, 0), // 图片集合，要显示的下标
              );
            },
            child: _NineGrid(context, circleItem.pic),
          ),

          Visibility(
            visible: !isDetail,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                _RePraCom(context, circleItem),
                new Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 1,
                  color: Color(0xffF2F2F2),
                ),
              ],
            ),
          ) //下划线
        ],
      ),
    );
  }
}

//发布者昵称头像布局
Widget _authorRow(BuildContext context, CircleModel item) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
    child: Row(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 5),
            child: Stack(
              children: <Widget>[
                Container(
                    width: 42.0,
                    height: 42.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: NetworkImage(item.head_pic_url),
                          fit: BoxFit.cover),
                    )),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                      // child: Image.asset(
                      //   Constant.ASSETS_IMG + 'fans_jijun.png',
                      //   width: 20.0,
                      //   height: 20.0,
                      // ),
                      ),
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                    child: Text(
                      item.nickname,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromRGBO(51, 51, 51, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: new Container(),
                )
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(6.0, 2.0, 0.0, 0.0),
            //   child: Text(
            //     'item.user_author_is_sign.',
            //     style: TextStyle(color: Color(0xff808080), fontSize: 11.0),
            //   ),
            // ),
          ],
        ),
        // Expanded(
        //   child: new Align(
        //     alignment: FractionalOffset.centerRight,
        //     child: GestureDetector(
        //       child: Container(
        //         padding: new EdgeInsets.only(
        //             top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
        //         decoration: new BoxDecoration(
        //           color: Colors.white,
        //           border: Border.all(color: Colors.orange),
        //           borderRadius: new BorderRadius.circular(12.0),
        //         ),
        //         child: Text(
        //           '+ 关注',
        //           style: TextStyle(color: Colors.orange, fontSize: 12),
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    ),
  );
}

// 文字
Widget textContent(String mTextContent, BuildContext context, bool isDetail) {
  if (!isDetail) {
    //如果字数过长
    if (mTextContent.length > 150) {
      mTextContent = mTextContent.substring(0, 148) + ' ... ' + '全文';
    }
  }
  mTextContent = mTextContent.replaceAll("\\n", "\n");
  return Container(
    alignment: FractionalOffset.centerLeft,
    margin: EdgeInsets.only(top: 5.0, left: 15, right: 15, bottom: 5),
    child: Text(
      mTextContent,
      style: TextStyle(
        color: Color.fromRGBO(51, 51, 51, 1),
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
    ),
  );
}

//转发收藏点赞布局
Widget _RePraCom(BuildContext context, CircleModel item) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      new Flexible(
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
        flex: 3,
      ),
      new Flexible(
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Constant.ASSETS_IMG + 'novel_detail_collect.png',
                width: 22.0,
                height: 22.0,
              ),
              Container(
                child: Text('1000' + "",
                    style: TextStyle(color: Colors.black, fontSize: 13)),
                margin: EdgeInsets.only(left: 4.0),
              ),
            ],
          ),
        ),
        flex: 1,
      ),
      new Flexible(
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Constant.ASSETS_IMG + 'circle_comment.png',
                width: 22.0,
                height: 22.0,
              ),
              Container(
                child: Text('99' + "",
                    style: TextStyle(color: Colors.black, fontSize: 13)),
                margin: EdgeInsets.only(left: 4.0),
              ),
            ],
          ),
        ),
        flex: 1,
      ),
    ],
  );
}

//九宫格图片布局
Widget _NineGrid(BuildContext context, List<PicInfo> picUrlList) {
  List<PicInfo> picList = picUrlList;
  //如果包含九宫格图片
  if (picList != null && picList.length > 0) {
    //一共有几张图片
    num len = picList.length;
    //算出一共有几行
    int rowlength = 0;
    //一共有几列
    int conlength = 0;
    if (len <= 3) {
      conlength = len;
      rowlength = 1;
    } else if (len <= 6) {
      conlength = 3;
      rowlength = 2;
      if (len == 4) {
        conlength = 2;
      }
    } else {
      conlength = 3;
      rowlength = 3;
    }
    //一行的组件
    List<Widget> imgList = [];
    //一行包含三个图片组件
    List<List<Widget>> rows = [];
    //遍历行数和列数,计算出宽高生成每个图片组件,
    for (var row = 0; row < rowlength; row++) {
      List<Widget> rowArr = [];
      for (var col = 0; col < conlength; col++) {
        num index = row * conlength + col;
        num screenWidth = MediaQuery.of(context).size.width;
        double cellWidth = (screenWidth - 50) / 3;
        double itemW = 0;
        double itemH = 0;
        if (len == 1) {
          itemW = cellWidth;
          itemH = cellWidth;
        } else if (len <= 3) {
          itemW = cellWidth;
          itemH = cellWidth;
        } else if (len <= 6) {
          itemW = cellWidth;
          itemH = cellWidth;
          if (len == 4) {
            itemW = cellWidth;
            itemH = cellWidth;
          }
        } else {
          itemW = cellWidth;
          itemH = cellWidth;
        }
        if (len == 1) {
          rowArr.add(Container(
            constraints: BoxConstraints(
              maxHeight: 250,
              maxWidth: 250,
              minHeight: 200,
              minWidth: 200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0), //弧度
                child: Image.network(picList[index].path, fit: BoxFit.cover),
              ),
            ),
          ));
        } else {
          if (index < len) {
            EdgeInsets mMargin;
            if (len == 4) {
              if (index == 0) {
                mMargin = const EdgeInsets.only(right: 2.5, bottom: 5);
              } else if (index == 1) {
                mMargin = const EdgeInsets.only(left: 2.5, bottom: 5);
              } else if (index == 2) {
                mMargin = const EdgeInsets.only(right: 2.5);
              } else if (index == 3) {
                mMargin = const EdgeInsets.only(left: 2.5);
              }
            } else {
              if (index == 1 || index == 4 || index == 7) {
                mMargin =
                    const EdgeInsets.only(left: 2.5, right: 2.5, bottom: 5);
              } else if (index == 0 || index == 3 || index == 6) {
                mMargin = const EdgeInsets.only(right: 2.5, bottom: 5);
              } else if (index == 2 || index == 5 || index == 8) {
                mMargin = const EdgeInsets.only(left: 2.5, bottom: 5);
              }
            }

            rowArr.add(Container(
              child: Container(
                margin: mMargin,
                child: NovelCoverImage(picList[index].path,
                    width: itemW, height: itemH),
              ),
            ));
          }
        }
      }
      rows.add(rowArr);
    }
    for (var row in rows) {
      imgList.add(Row(
        children: row,
      ));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
      child: Column(
        children: imgList,
      ),
    );
  } else {
    return Container(
      height: 0,
    );
  }
}

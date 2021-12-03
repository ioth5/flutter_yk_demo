import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:yk_demo/model/novel.dart';
import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/styles.dart';
import 'package:yk_demo/util/toast.dart';
import 'package:yk_demo/widget/dashline/dashline.dart';

class BookshelfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookshelfState();
}

class BookshelfState extends State<BookshelfPage> {
  List<Novel> favoriteNovels = [];
  ScrollController scrollController = ScrollController();
  double navAlpha = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      FormData formData = FormData.fromMap({
        "pageNum": "1",
      });
      DioManager.getInstance().get(ServiceUrl.dailyNovel, formData, (data) {
        print("接口异常：" + data);
        setState(() {});
      }, (error) {
        print("接口异常：" + error);
        //  ToastUtil.show(error);
        setState(() {});
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  Widget buildActions(Color iconColor) {
    return Row(children: <Widget>[
      Container(
        height: kToolbarHeight,
        width: 3.5,
        child: Image.asset(Constant.ASSETS_IMG + 'shelf_more.png'),
      ),
      SizedBox(width: 15)
    ]);
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          child: Container(
            margin: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            child: buildActions(SQColor.white),
          ),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            height: Screen.navigationBarHeight,
            color: SQColor.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '书架',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildActions(SQColor.darkGray),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTopView() {
    return Container(
      // padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Container(
        padding: EdgeInsets.only(
          left: 15,
          top: 15,
          right: 15,
          bottom: 15,
        ),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: new Border.all(
            color: Color.fromRGBO(237, 237, 237, 1), //边框颜色
            width: 1, //边框宽度
          ), // 边色与边宽度
          color: Colors.white, // 底色
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(237, 237, 237, 1),
                offset: Offset(3.0, 3.0),
                blurRadius: 10.0,
                spreadRadius: 2.0),
          ],
          borderRadius: BorderRadius.circular(20), // 圆角也可控件一边圆角大小
          //borderRadius: BorderRadius.only(
          //  topRight: Radius.circular(10),
          // bottomRight: Radius.circular(10)) //单独加某一边圆角
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Routes.navigateTo(context, Routes.novelDetailPage,
                    transition: TransitionType.native,
                    params: {
                      'novelid': '1',
                    });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DecoratedBox(
                    child: Image.asset(
                      Constant.ASSETS_IMG + "book_pic.jpeg",
                      width: 80,
                      height: 107,
                    ),
                    decoration: BoxDecoration(boxShadow: Styles.borderShadow),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '天空是蔚蓝色',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        buildTags(),
                        Text(
                          '这里只显示这里只显示一排简介文案字舒服烤红一排简介文案字舒服烤红...',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, color: SQColor.gray),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            DashLine(
              color: Color.fromRGBO(241, 241, 241, 1),
              height: 1,
              dashWidth: 4,
            ),
            SizedBox(height: 12),
            Column(
              children: <Widget>[
                // Divider(height: 1),
                Container(
                  // height: 40,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        Constant.ASSETS_IMG + "shelf_sign.png",
                        width: 14,
                        height: 13,
                      ),
                      SizedBox(width: 5),
                      // SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '今日已签到，可领取糖豆哦！',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 62,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(Constant.ASSETS_IMG +
                                  'novelWrite_btnback.png'),
                              fit: BoxFit.fill),
                        ),
                        // alignment: Alignment.center,
                        child: TextButton(
                          onPressed: null,
                          style: ButtonStyle(
                            //定义文本的样式 这里设置的颜色是不起作用的
                            textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 15),
                            ),
                            //设置按钮上字体与图标的颜色
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            //设置按钮内边距
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(0)),
                            //设置按钮的大小
                            minimumSize:
                                MaterialStateProperty.all(Size(62, 25)),
                          ),
                          child: Text('充值'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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

  Widget buildFavoriteView() {
    if (favoriteNovels.length <= 1) {
      return Container();
    }

    List<Widget> children = [];
    var novels = favoriteNovels.sublist(1);
    novels.forEach((novel) {});
    var width = (Screen.width - 15 * 2 - 24 * 2) / 3;
    children.add(GestureDetector(
      onTap: () {},
      child: Container(
        color: SQColor.paper,
        width: width,
        height: width / 0.75,
        child: Image.asset(Constant.ASSETS_IMG + 'bookshelf_add.png'),
      ),
    ));
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Wrap(
        spacing: 23,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SQColor.white,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Stack(children: [
          RefreshIndicator(
            onRefresh: fetchData,
            child: ListView(
              padding: EdgeInsets.only(top: Screen.navigationBarHeight),
              controller: scrollController,
              children: <Widget>[
                buildTopView(),
                buildFavoriteView(),
              ],
            ),
          ),
          buildNavigationBar(),
        ]),
      ),
    );
  }
}

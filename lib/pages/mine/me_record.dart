import 'package:flutter/material.dart';
import 'package:yk_demo/model/mine_model.dart';
import 'package:yk_demo/public.dart';

class MeRecord extends StatelessWidget {
  final List<MineModel> modules;
  final String cellTitle;

  MeRecord(this.cellTitle, this.modules);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        padding: EdgeInsets.only(
          left: 15,
          top: 20,
          right: 15,
          bottom: 10,
        ),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: new Border.all(
            color: Color.fromRGBO(237, 237, 237, 0.9), //边框颜色
            width: 1, //边框宽度
          ), // 边色与边宽度
          color: Colors.white, // 底色
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(237, 237, 237, 0.9),
                offset: Offset(5.0, 5.0),
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
            Text(
              cellTitle,
              textAlign: TextAlign.left,
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(51, 51, 51, 1)),
            ),
            SizedBox(
              height: 22,
            ),
            GridView.count(
              //解决无限高度问题
              shrinkWrap: true,
              //禁用滑动事件
              physics: NeverScrollableScrollPhysics(),
              //水平子Widget之间间距
              crossAxisSpacing: 20.0,
              //垂直子Widget之间间距
              mainAxisSpacing: 0.0,
              //GridView内边距
              padding: EdgeInsets.all(0.0),
              //一行的Widget数量
              crossAxisCount: 4,
              //子Widget宽高比例
              childAspectRatio: 1,
              //子Widget列表
              children: modules
                  .map((info) => getItemContainer(context, info))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getItemContainer(context, MineModel info) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Routes.navigateTo(context, Routes.loginPage,
              transition: TransitionType.native);
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 9),
              child: Image.asset(
                info.pic,
                width: 22,
                height: 22,
              ),
            ),
            Container(
              child: Text(
                info.name,
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

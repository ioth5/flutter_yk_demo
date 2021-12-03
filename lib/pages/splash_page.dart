import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yk_demo/constant/constant.dart';
import 'package:yk_demo/routers/routers.dart';
import 'package:yk_demo/util/sp_util.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  SplashPageState createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // App启动时读取Sp数据，需要异步等待Sp初始化完成。
    SpUtil.getInstance();
    Future.delayed(new Duration(seconds: 1), () {
      Routes.navigateTo(context, Routes.indexPage, clearStack: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 200),
                    child: Image.asset(
                      Constant.ASSETS_IMG + 'welcome_android_slogan2.png',
                      width: 200.0,
                      height: 100.0,
                    ),
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      Constant.ASSETS_IMG + 'welcome_android_logo1.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    color: Color(0xFFFFFFFF),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

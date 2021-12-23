import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yk_demo/pages/splash_page.dart';
import 'package:yk_demo/public.dart';

void main() {
  runApp(new MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Routes.router = router;

    return Container(
      child: MaterialApp(
          title: "小说",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            dividerColor: Color(0xffeeeeee),
            scaffoldBackgroundColor: SQColor.paper,
            textTheme: TextTheme(bodyText1: TextStyle(color: SQColor.darkGray)),
          ),
          onGenerateRoute: Routes.router.generator,
          builder: (context, widget) {
            return MediaQuery(
              ///设置文字大小不随系统设置改变
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
          home: SplashPage()),
    );
  }
}

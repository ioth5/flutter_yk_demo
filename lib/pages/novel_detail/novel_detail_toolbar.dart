import 'package:flutter/material.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/app_navigator.dart';
import 'package:yk_demo/util/styles.dart';

class NovelDetailToolbar extends StatelessWidget {
  read() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Screen.bottomSafeHeight),
      decoration:
          BoxDecoration(color: Colors.white, boxShadow: Styles.borderShadow),
      height: 70 + Screen.bottomSafeHeight,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Container(
            width: 130,
            height: 45,
            decoration: BoxDecoration(
                color: Color.fromRGBO(243, 243, 243, 1),
                borderRadius: BorderRadius.circular(23)),
            child: Center(
              child: Text(
                '加书架',
                style: TextStyle(fontSize: 16, color: SQColor.gray),
              ),
            ),
          ),
          SizedBox(
            width: 18,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                AppNavigator.pushReader(context, 1);
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(253, 120, 150, 1),
                      Color.fromRGBO(235, 129, 181, 1),
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    borderRadius: BorderRadius.circular(23)),
                child: Center(
                  child: Text(
                    '开始阅读',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}

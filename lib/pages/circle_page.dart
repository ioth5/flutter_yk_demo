import 'package:flutter/material.dart';
import 'package:yk_demo/util/toast.dart';
import 'package:yk_demo/util/yk_color.dart';

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  login() async {
    try {
      print('11111');
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  Widget buildBody() {
    var container = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: SQColor.primary,
      ),
      height: 40.0,
      child: TextButton(
        onPressed: login,
        child: Text(
          '登录',
          style: TextStyle(fontSize: 16.0, color: Color(0xffffffff)),
        ),
      ),
    );

    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),
              SizedBox(height: 10),
              container,
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }
}

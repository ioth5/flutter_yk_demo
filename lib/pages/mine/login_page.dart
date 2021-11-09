import 'package:flutter/material.dart';
import 'dart:async';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/toast.dart';
import 'code_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneEditer = TextEditingController();
  TextEditingController codeEditer = TextEditingController();
  int coldDownSeconds = 0;
  Timer timer;

  fetchSmsCode() async {
    if (phoneEditer.text.length == 0) {
      return;
    }

    try {
      // await Request.post(
      //   action: 'sms',
      //   params: {'phone': phoneEditer.text, 'type': 'login'},
      // );

      setState(() {
        coldDownSeconds = 60;
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  login() async {
    var phone = phoneEditer.text;
    var code = codeEditer.text;

    try {
      // var response = await Request.post(action: 'login', params: {
      //   'phone': phone,
      //   'code': code,
      // });
      // print(response);
      // UserManager.instance.login(response);

      Navigator.pop(context);
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  coldDown() {
    timer = Timer(Duration(seconds: 1), () {
      setState(() {
        --coldDownSeconds;
      });

      coldDown();
    });
  }

  Widget buildPhone() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: SQColor.paper,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextField(
        controller: phoneEditer,
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 14, color: SQColor.darkGray),
        decoration: InputDecoration(
          labelText: '请输入手机号',
          hintStyle: TextStyle(color: SQColor.gray),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildCode() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: SQColor.paper,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: codeEditer,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 14, color: SQColor.darkGray),
              decoration: InputDecoration(
                hintText: '请输入短信验证码',
                hintStyle: TextStyle(color: SQColor.gray),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(color: Color(0xffdae3f2), width: 1, height: 40),
          CodeButton(
            onPressed: fetchSmsCode,
            coldDownSeconds: coldDownSeconds,
          ),
        ],
      ),
    );
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
              buildPhone(),
              SizedBox(height: 10),
              buildCode(),
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

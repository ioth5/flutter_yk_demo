import 'package:flutter/material.dart';
import 'package:yk_demo/pages/mine/login_page.dart';

class DispatchPage extends StatefulWidget {
  @override
  _DispatchPageState createState() => _DispatchPageState();
}

class _DispatchPageState extends State<DispatchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';

class DispatchPage extends StatefulWidget {
  @override
  _DispatchPageState createState() => _DispatchPageState();
}

class _DispatchPageState extends State<DispatchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        children: [
          Text("我是文本1"),
          Text("我是文本2"),
          Text("我是文本3"),
          Text("我是文本4"),
          Text("我是文本5"),
          Text("我是文本6"),
          Text("我是文本7"),
          Text("我是文本8"),
          Text("我是文本9"),
        ],
      ),
    );
  }
}

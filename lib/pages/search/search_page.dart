import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/styles.dart';

import 'package:yk_demo/util/toast.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditer = TextEditingController();

  double navAlpha = 1;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      setState(() {});
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  Widget buildActions() {
    return Row(children: <Widget>[
      Container(
        child: Text(
          '搜索',
          style: TextStyle(
            color: Color.fromRGBO(253, 120, 150, 1),
            fontSize: 15.0,
          ),
        ),
      ),
      SizedBox(width: 15)
    ]);
  }

  Widget buildText() {
    return Container(
      height: 36,
      padding: EdgeInsets.only(left: 0, right: 0),
      decoration: BoxDecoration(
        color: SQColor.paper,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: TextField(
        controller: textEditer,
        keyboardType: TextInputType.text,
        cursorColor: SQColor.gray,
        style: TextStyle(fontSize: 14, color: SQColor.red, height: 1.1),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.grey,
          ),
          hintText: '请输入书名/作者/主角名',
          labelStyle: TextStyle(color: SQColor.gray),
          hintStyle: TextStyle(color: SQColor.gray),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          child: Container(
            margin: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            child: buildActions(),
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
                new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Colors.black54),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  flex: 1,
                  child: buildText(),
                ),
                SizedBox(
                  width: 15,
                ),
                buildActions(),
              ],
            ),
          ),
        ),
      ],
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
              children: <Widget>[],
            ),
          ),
          buildNavigationBar(),
        ]),
      ),
    );
  }
}

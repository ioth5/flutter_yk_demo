import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yk_demo/pages/search/search_hot.dart';

import 'package:yk_demo/public.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditer = TextEditingController();

  @override
  void initState() {
    super.initState();
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
    return Container(
      child: Row(
        children: <Widget>[
          new IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerLeft,
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
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
    );
  }

  Widget buildHotSearch() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            '热门搜索',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 0.1,
        ),
        leading: null,
        automaticallyImplyLeading: false,
        title: buildNavigationBar(),
        backgroundColor: SQColor.white,
        elevation: 0,
      ),
      backgroundColor: SQColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHotSearch(),
          SearchHotContent(),
        ],
      ),
    );
  }
}

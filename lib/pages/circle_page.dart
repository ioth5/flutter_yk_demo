import 'package:flutter/material.dart';
import 'package:yk_demo/pages/circle/circle_list_view.dart';
import 'package:yk_demo/public.dart';

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  final List<String> _tabValues = ['精选', '新人报道', '日常', '绘画', '小说', '壁纸', '动漫'];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length, //Tab页数量
      vsync: ScrollableState(), //动画效果的异步处理
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: Screen.topSafeHeight,
            color: Color(0xffffffff),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 45,
                color: Color(0xffffffff),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: TabBar(
                        labelColor: SQColor.darkGray,
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        unselectedLabelColor: SQColor.gray,
                        indicatorColor: Color.fromRGBO(253, 120, 150, 1),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 3,
                        indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                        isScrollable: true,
                        unselectedLabelStyle: TextStyle(fontSize: 16.0),
                        controller: _controller,
                        tabs: [
                          new Tab(
                            text: _tabValues[0],
                          ),
                          new Tab(
                            text: _tabValues[1],
                          ),
                          new Tab(
                            text: _tabValues[2],
                          ),
                          new Tab(
                            text: _tabValues[3],
                          ),
                          new Tab(
                            text: _tabValues[4],
                          ),
                          new Tab(
                            text: _tabValues[5],
                          ),
                          new Tab(
                            text: _tabValues[6],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      Constant.ASSETS_IMG + "cirlce_all_icon.png",
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          new Expanded(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                CircleListView(),
                CircleListView(),
                CircleListView(),
                CircleListView(),
                Center(
                  child: Text("暂无数据5"),
                ),
                Center(
                  child: Text("暂无数据6"),
                ),
                Center(
                  child: Text("暂无数据"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yk_demo/pages/home/home_list_view.dart';
import 'package:yk_demo/public.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: TabBar(
              labelColor: SQColor.darkGray,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: SQColor.gray,
              indicatorColor: SQColor.secondary,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
              tabs: [
                Tab(text: '纯爱'),
                Tab(text: '言情'),
                Tab(text: '快穿'),
                Tab(text: 'ABO'),
              ],
            ),
          ),
          backgroundColor: SQColor.white,
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            HomeListView(HomeListType.excellent),
            HomeListView(HomeListType.female),
            HomeListView(HomeListType.male),
            HomeListView(HomeListType.cartoon),
          ],
        ),
      ),
    );
  }
}

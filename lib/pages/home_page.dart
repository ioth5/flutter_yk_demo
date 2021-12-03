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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    labelColor: SQColor.darkGray,
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    unselectedLabelColor: SQColor.gray,
                    indicatorColor: Color.fromRGBO(253, 120, 150, 1),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                    isScrollable: true,
                    tabs: [
                      Tab(text: '纯爱'),
                      Tab(text: '言情'),
                    ],
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    Constant.ASSETS_IMG + "home_search.png",
                    width: 22,
                    height: 22,
                  ),
                  onTap: () {
                    Routes.navigateTo(context, Routes.searchPage,
                        transition: TransitionType.native);
                  },
                ),
              ],
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage(Constant.ASSETS_IMG + 'home_top_title_bg.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: SQColor.white,
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            HomeListView(HomeListType.excellent),
            HomeListView(HomeListType.female),
          ],
        ),
      ),
    );
  }
}

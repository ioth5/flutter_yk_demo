import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yk_demo/public.dart';

import 'home_page.dart';
import 'mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['书城', '书架', '发文', '甜甜圈', '我的'];
  var currentPage;
  DateTime lastPopTime;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 13.0, color: Colors.black));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 13.0, color: Colors.black));
    }
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 25.0, height: 25.0);
  }

  void initData() {
    tabImages = [
      [
        getTabImage(Constant.ASSETS_IMG + 'tabbar_home_n.png'),
        getTabImage(Constant.ASSETS_IMG + 'tabbar_home.png')
      ],
      [
        getTabImage(Constant.ASSETS_IMG + 'tabbar_shelf_n.png'),
        getTabImage(Constant.ASSETS_IMG + 'tabbar_shelf.png')
      ],
      [
        getTabImage(Constant.ASSETS_IMG + 'tabbar_write_sel_n.png'),
        getTabImage(Constant.ASSETS_IMG + 'tabbar_write_sel.png')
      ],
      [
        getTabImage(Constant.ASSETS_IMG + 'tabbar_circle_n.png'),
        getTabImage(Constant.ASSETS_IMG + 'tabbar_circle.png')
      ],
      [
        getTabImage(Constant.ASSETS_IMG + 'tabbar_my_n.png'),
        getTabImage(Constant.ASSETS_IMG + 'tabbar_my.png')
      ],
    ];
  }

  final List<Widget> tabBodies = [
    HomePage(),
    BookshelfPage(),
    DispatchPage(),
    CirclePage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    initData();
    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(icon: getTabIcon(0), label: '书城'),
      BottomNavigationBarItem(icon: getTabIcon(1), label: '书架'),
      BottomNavigationBarItem(icon: getTabIcon(2), label: '发文'),
      BottomNavigationBarItem(icon: getTabIcon(3), label: '甜甜圈'),
      BottomNavigationBarItem(icon: getTabIcon(4), label: '我的'),
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(253, 120, 150, 1),
        selectedFontSize: 12,
        currentIndex: _tabIndex,
        items: bottomTabs,
        onTap: (index) async {
          setState(() {
            _tabIndex = index;
            if (_tabIndex == 2) {
              Routes.navigateTo(context, Routes.loginPage,
                  transition: TransitionType.native);
            }
            currentPage = tabBodies[_tabIndex];
          });
        },
      ),
      body: IndexedStack(
        index: _tabIndex,
        children: tabBodies,
      ),
    );
    // ignore: missing_return
  }
}

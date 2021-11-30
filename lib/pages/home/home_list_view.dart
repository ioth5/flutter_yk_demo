import 'package:flutter/material.dart';
import 'package:yk_demo/pages/home/home_banner.dart';
import 'package:dio/dio.dart';
import 'package:yk_demo/pages/home/home_menu.dart';
import 'package:yk_demo/pages/home/novel_first_hybird_card.dart';
import 'package:yk_demo/pages/home/novel_four_grid_view.dart';
import 'package:yk_demo/pages/home/novel_normal_card.dart';
import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/toast.dart';

import 'home_model.dart';
import 'novel_second_hybird_card.dart';

enum HomeListType {
  excellent,
  male,
  female,
  cartoon,
}

class HomeListView extends StatefulWidget {
  HomeListView(this.type);

  final HomeListType type;

  @override
  State<StatefulWidget> createState() {
    return HomeListViewState();
  }
}

class HomeListViewState extends State<HomeListView>
    with AutomaticKeepAliveClientMixin {
  HomeModule homeModule;
  List<BannerInfo> banners = [];
  List<MenuInfo> menus = [];
  List<Recmds> recmds = [];
  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> fetchData() async {
    try {
      // icons
      var menu = [
        {
          "icon": Constant.ASSETS_IMG + "biaoqian.png",
          "title": '标签找书',
          "r": 93,
          "g": 163,
          "b": 243,
        },
        {
          "icon": Constant.ASSETS_IMG + "hongbao.png",
          "title": '排行榜',
          "r": 255,
          "g": 142,
          "b": 96
        },
        {
          "icon": Constant.ASSETS_IMG + "paihang.png",
          "title": '红包广场',
          "r": 242,
          "g": 106,
          "b": 130
        },
      ];

      FormData formData = FormData.fromMap({"sex": 0});
      DioManager.getInstance().get(ServiceUrl.indexV2, formData, (data) {
        var responseJson = data;
        var moduleData = responseJson['data'];
        // 处理 banner 数据
        var banner = moduleData['banners'];
        // 处理 recmd 数据
        var recmd = moduleData['recmds'];

        List<BannerInfo> banners = [];
        List<Recmds> recmds = [];
        List<MenuInfo> menus = [];

        banner.forEach((data) {
          banners.add(BannerInfo.fromJson(data));
        });

        menu.forEach((data) {
          menus.add(MenuInfo.fromJson(data));
        });

        recmd.forEach((data) {
          recmds.add(Recmds.fromJson(data));
        });

        setState(() {
          this.homeModule = HomeModule.fromJson(moduleData);
          this.banners = banners;
          this.menus = menus;
          this.recmds = recmds;
        });
      }, (error) {
        print("接口异常：" + error);
        // ToastUtil.show(error);
        setState(() {});
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  Widget bookCardWithInfo(Recmds recmds) {
    Widget card;
    switch (recmds.style_type) {
      case 1:
        card = NovelFirstHybirdCard(recmds);
        break;
      case 2:
        card = NovelSecondHybirdCard(recmds);
        break;
      case 3:
        card = NovelNormalCard(recmds);
        break;
      case 4:
        card = NovelNormalCard(recmds);
        break;
      case 5:
        card = NovelFourGridView(recmds);
        break;
    }
    return card;
  }

  Widget buildModule(Recmds recmds) {
    if (recmds != null) {
      return bookCardWithInfo(recmds);
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (banners == null) {
      return Container();
    }

    return Container(
      child: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView(
          // shrinkWrap: true,
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            HomeBanner(banners),
            HomeMenu(menus),
            Column(
              children: recmds.map((item) => buildModule(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

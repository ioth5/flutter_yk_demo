import 'package:flutter/material.dart';
import 'package:yk_demo/pages/home/home_banner.dart';
import 'package:dio/dio.dart';
import 'package:yk_demo/pages/home/home_menu.dart';
import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/toast.dart';

import 'home_model.dart';

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
  List<BannerInfo> banner = [];
  HomeModule homeModule;
  List<MenuInfo> menus = [];
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
      var action;
      switch (this.widget.type) {
        case HomeListType.excellent:
          action = 'home_excellent';
          break;
        case HomeListType.female:
          action = 'home_female';
          break;
        case HomeListType.male:
          action = 'home_male';
          break;
        case HomeListType.cartoon:
          action = 'home_cartoon';
          break;
        default:
          break;
      }
      FormData formData = FormData.fromMap({"sex": 0});
      DioManager.getInstance().get(ServiceUrl.indexV2, formData, (data) {
        var responseJson = data;
        var moduleData = responseJson['data'];
        // 处理 banner 数据
        var banners = moduleData['banners'];
        List<BannerInfo> banner = [];

        banners.forEach((data) {
          banner.add(BannerInfo.fromJson(data));
        });
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

        List<MenuInfo> menus = [];
        menu.forEach((data) {
          menus.add(MenuInfo.fromJson(data));
        });

        setState(() {
          this.homeModule = HomeModule.fromJson(moduleData);

          this.banner = banner;
          this.menus = menus;
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (banner == null) {
      return Container();
    }
    return Container(
      child: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            HomeBanner(banner),
            HomeMenu(menus),
          ],
        ),
      ),
    );
  }
}

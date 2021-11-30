import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:yk_demo/pages/home/home_banner.dart';
import 'package:yk_demo/pages/home/home_model.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/toast.dart';

import 'circle_model.dart';

class CircleListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleListViewState();
  }
}

class CircleListViewState extends State<CircleListView>
    with AutomaticKeepAliveClientMixin {
  int pageIndex = 1;
  List<BannerInfo> banners = [];
  List<CirlceModule> modules = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> fetchData() async {
    try {
      // banner
      FormData formData1 = FormData.fromMap({"position_id": '1'});
      DioManager.getInstance().get(ServiceUrl.banners, formData1, (data) {
        var banner = data['data'];
        List<BannerInfo> banners = [];
        banner.forEach((data) {
          banners.add(BannerInfo.fromJson(data));
        });

        setState(() {
          this.banners = banners;
        });
      }, (error) {
        print("接口异常：" + error);
      });
      // 列表数据
      FormData formData =
          FormData.fromMap({"p": 1, "source_page": 'forum_tag_group'});
      DioManager.getInstance().get(ServiceUrl.forumPosts, formData, (data) {
        List moduleData = data['data'];
        List<CirlceModule> modules = [];
        moduleData.forEach((data) {
          modules.add(CirlceModule.fromJson(data));
        });

        setState(() {
          this.modules = modules;
        });
      }, (error) {
        print("接口异常：" + error);
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      child: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView(
          // shrinkWrap: true,
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            HomeBanner(banners),
          ],
        ),
      ),
    );
  }
}

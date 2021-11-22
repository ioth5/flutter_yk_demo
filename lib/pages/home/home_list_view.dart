import 'package:flutter/material.dart';
import 'package:yk_demo/pages/home/home_banner.dart';
import 'package:dio/dio.dart';
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
  final HomeListType type;

  HomeListView(this.type);

  @override
  State<StatefulWidget> createState() {
    return HomeListViewState();
  }
}

class HomeListViewState extends State<HomeListView>
    with AutomaticKeepAliveClientMixin {
  List<CarouselInfo> carouselInfos = [];
  int pageIndex = 1;
  List<HomeModule> modules = [];

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
        List moduleData = responseJson['data'];
        List<HomeModule> modules = [];
        moduleData.forEach((data) {
          modules.add(HomeModule.fromJson(data));
        });

        setState(() {
          this.modules = modules;
          this.carouselInfos = carouselInfos;
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

  Widget buildModule(BuildContext context, HomeModule module) {
    if (module.carousels != null) {
      return HomeBanner(module.carousels);
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
          itemCount: modules.length,
          itemBuilder: (BuildContext context, int index) {
            return buildModule(context, modules[index]);
          },
        ),
      ),
    );
  }
}

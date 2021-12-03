import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yk_demo/model/mine_model.dart';
import 'package:yk_demo/public.dart';

import 'package:yk_demo/pages/mine/me_header.dart';
import 'package:yk_demo/pages/mine/me_record.dart';
import 'package:yk_demo/util/toast.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List<MineModel> modules0 = [];
  List<MineModel> modules1 = [];
  String title0;
  String title1;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var responseJson = {
        "title0": '作家专区',
        "title1": '个人服务',
        "data0": [
          {
            "pic": Constant.ASSETS_IMG + "personal_myPublish.png",
            "name": "我的发布"
          },
          {
            "pic": Constant.ASSETS_IMG + "personal_myPraise.png",
            "name": "我赞过的"
          },
          {
            "pic": Constant.ASSETS_IMG + "personal_readrecord.png",
            "name": "最近阅读"
          },
          {
            "pic": Constant.ASSETS_IMG + "personal_chongzhi.png",
            "name": "充值记录"
          },
          {"pic": Constant.ASSETS_IMG + "personal_notice1.png", "name": "消息中心"},
        ],
        "data": [
          {"pic": Constant.ASSETS_IMG + "personal_fulishe.png", "name": "福利社"},
          {"pic": Constant.ASSETS_IMG + "personal_setting.png", "name": "设置"},
          {"pic": Constant.ASSETS_IMG + "personal_group.png", "name": "作者福利"},
          {"pic": Constant.ASSETS_IMG + "personal_advice.png", "name": "意见反馈"},
          {"pic": Constant.ASSETS_IMG + "personal_aboutus.png", "name": "关于我们"},
        ],
      };

      List moduleData0 = responseJson['data0'];
      List moduleData = responseJson['data'];
      title0 = responseJson['title0'];
      title1 = responseJson['title1'];
      List<MineModel> modules0 = (moduleData0)
          .map((e) => MineModel.fromJson((e as Map<String, dynamic>)))
          .toList();
      List<MineModel> modules1 = (moduleData)
          .map((e) => MineModel.fromJson((e as Map<String, dynamic>)))
          .toList();
      setState(() {
        this.modules0 = modules0;
        this.modules1 = modules1;
        this.title0 = title0;
        this.title1 = title1;
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              MeHeader(),
              MeRecord(title0, modules0),
              MeRecord(title1, modules1),
            ],
          ),
        ),
      ),
    );
  }
}

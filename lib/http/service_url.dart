import 'package:yk_demo/constant/constant.dart';

class ServiceUrl {
  // 请求成功
  static const API_CODE_SUCCESS = "200";
  static String dailyNovel = Constant.baseUrl + 'api/v1/dailyNovel'; // 每日小说推荐
  static String bookShelfs =
      Constant.baseUrl + 'api/v1/bookShelfs'; // 获取用户收藏的小说列表

  static String indexV2 = Constant.baseUrl + 'api/v3/index'; // 获取首页数据

  /// ------------------------------- old -----------------------------
  static String login = Constant.baseUrl + 'manage/hrluser/login.do'; // 登录

}

import 'package:flutter/material.dart';
import 'package:yk_demo/public.dart';

class Routes {
// 路由管理
  static FluroRouter router;
  static String indexPage = '/indexpage';
  static String bookshelfPage = '/bookshelfPage';
  static String loginPage = '/loginpage';
  static String settingPage = '/settingpage';
  static String dispatchPage = '/dispatchPage';
  static String circlePage = '/circlePage';
  static String novelDetailPage = '/novelDetailPage';
  static String readerPage = '/readerPage';
  static String searchPage = '/searchPage';

  static void configureRoutes(FluroRouter router) {
    // List widgetDemosList = new WidgetDemoList().getDemos();
    router.notFoundHandler = new Handler(
        handlerFunc:
            // ignore: missing_return
            (BuildContext context, Map<String, List<String>> params) {});

    router.define(indexPage, handler: indexPageHandler);
    router.define(bookshelfPage, handler: bookshelfPageHandler);
    router.define(dispatchPage, handler: dispatchPageHandler);
    router.define(circlePage, handler: CirclePageHandler);
    router.define(settingPage, handler: settingPageHandler);
    router.define(loginPage, handler: loginPageHandler);
    router.define(settingPage, handler: settingPageHandler);
    router.define(novelDetailPage, handler: novelDetailPageHandler);
    router.define(readerPage, handler: readerPageHandler);

    router.define(searchPage, handler: searchPageHandler);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配(https://www.jianshu.com/p/e575787d173c)
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return router.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配(https://www.jianshu.com/p/e575787d173c)
  static Future navigatepushAndRemoveUntil(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    path = path + query;
    return router.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
  }
}

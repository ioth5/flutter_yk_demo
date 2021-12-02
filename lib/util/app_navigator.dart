import 'package:flutter/material.dart';
import 'package:yk_demo/pages/novel_detail/novel_detail_scene.dart';
import 'package:yk_demo/pages/reader/reader_scene.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => scene,
      ),
    );
  }

  static pushNovelDetail(BuildContext context, id) {
    AppNavigator.push(context, NovelDetailScene(id));
  }

  static pushReader(BuildContext context, int articleId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReaderScene(articleId: articleId);
    }));
  }
}

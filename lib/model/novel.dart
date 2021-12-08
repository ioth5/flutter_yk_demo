import 'package:yk_demo/pages/home/home_model.dart';

class Novel {
  NovelInfo novels;

  ChapterInfo newest_chapter;

  Novel.fromJson(Map data) {
    novels = data['novels'];
    // newest_chapter = data['newest_chapter'];
  }
}

class NovelInfo {
  int id;
  int foreign_id;
  String title;
  String cover;
  int length;
  int progress;
  int free;
  int view_number;
  String desc;
  String short_desc;
  int rate_id;
  int cid;
  int author_id;
  String author_name;
  int sign_status;
  bool is_long;
  int chapter_count;
  bool sex;
  bool is_end;

  List tags;
  List<TagInfo> tagInfo;
  String tag_name;
  int month_ticket_num;
  int hot_num;
  int star_num;
  String score;
  int adpay;
  int flyleaf;
  int user_id;
  String long_desc;

  bool isLimitedFree;

  NovelInfo.fromJson(Map data) {
    id = data['id'];
    foreign_id = data['foreign_id'];
    title = data['title'];
    cover = data['cover'];
    length = data['length'];
    progress = data['progress'];
    free = data['free'];
    view_number = data['view_number'];
    desc = data['desc'];
    short_desc = data['short_desc'];
    rate_id = data['rate_id'];
    cid = data['cid'];
    author_id = data['author_id'];
    author_name = data['author_name'];
    sign_status = data['sign_status'];
    is_long = data['is_long'];
    chapter_count = data['chapter_count'];
    sex = data['sex'];
    is_end = data['is_end'];
    tag_name = data['tag_name'];
    month_ticket_num = data['month_ticket_num'];
    hot_num = data['hot_num'];
    star_num = data['star_num'];
    score = data['score'];
    adpay = data['adpay'];
    flyleaf = data['flyleaf'];
    user_id = data['user_id'];
    long_desc = data['long_desc'];
    score = data['score'];
    isLimitedFree = data['isLimitedFree'];

    tagInfo = [];
    if (tags != null) {
      tags.forEach((t) {
        tagInfo.add(TagInfo.fromJson(t));
      });
    }
  }
}

class ChapterInfo {
  String published_at;
  String name;

  ChapterInfo.fromJson(Map data) {
    published_at = data['published_at'];
    name = data['name'];
  }
}

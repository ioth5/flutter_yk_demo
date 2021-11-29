class HomeModule {
  List banners;
  List recmds;
  List<BannerInfo> banner;
  List<Recmds> recmd;

  HomeModule.fromJson(Map data) {
    banners = data['banners'];
    recmds = data['recmds'];

    banner = [];
    banners.forEach((data) {
      banner.add(BannerInfo.fromJson(data));
    });

    recmd = [];
    recmds.forEach((data) {
      recmd.add(Recmds.fromJson(data));
    });
  }
}

class BannerInfo {
  int id;
  String name;
  String pic_url;
  String link_url;
  int position_id;
  int redirect_type;
  int everyday_show_num;

  BannerInfo.fromJson(Map data) {
    id = data['id'];
    name = data['name'];
    pic_url = data['pic_url'];
    link_url = data['link_url'];
    position_id = data['position_id'];
    redirect_type = data['redirect_type'];
    everyday_show_num = data['everyday_show_num'];
  }
}

class Recmds {
  String name;
  List data;
  // List<RecmdsData> data;

  Recmds.fromJson(Map res) {
    name = res['name'];
    data = res['data'];
  }
}

class RecmdsData {
  int id;
  int recmd_id;
  int pcid;
  int novel_id;
  int sort;
  int sex;
  String title;
  String cover;
  String introduction;
  int type;
  int is_end;
  int length;
  int view_number;
  List tag;
  String tag_name;
  String author_name;
  String desc;
  String score;
  int hot_num;
  int flyleaf;
  int user_read_order;

  RecmdsData.fromJson(Map data) {
    id = data['id'];
    recmd_id = data['recmd_id'];
    pcid = data['pcid'];
    novel_id = data['novel_id'];
    sort = data['sort'];
    sex = data['sex'];
    title = data['title'];
    cover = data['cover'];
    introduction = data['introduction'];
    type = data['type'];
    is_end = data['is_end'];
    length = data['length'];
    view_number = data['view_number'];
    tag = data['tag'];
    tag = data['tag'];
    tag_name = data['tag_name'];
    author_name = data['author_name'];
    score = data['score'];
    hot_num = data['hot_num'];
    flyleaf = data['flyleaf'];
    user_read_order = data['user_read_order'];
  }
}

class MenuInfo {
  String icon;
  String title;
  String color;
  int r;
  int g;
  int b;

  MenuInfo.fromJson(Map data) {
    icon = data['icon'];
    title = data['title'];
    r = data['r'];
    g = data['g'];
    b = data['b'];
  }
}

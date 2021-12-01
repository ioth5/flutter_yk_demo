class CircleModel {
  int id;
  int user_id;
  int user_type;
  int user_author_is_sign;
  String nickname;
  String head_pic_url;
  String content;
  List pics;
  int novel_id;
  int is_hot;
  int add_time;
  int comment_num;
  int like_num;
  List tags;
  int user_author_id;
  String medal_url;

  List<PicInfo> pic;
  List<TagInfo> tag;

  CircleModel.fromJson(Map data) {
    id = data['id'];
    user_id = data['user_id'];
    user_type = data['user_type'];
    user_author_is_sign = data['user_author_is_sign'];
    nickname = data['nickname'];
    head_pic_url = data['head_pic_url'];
    content = data['content'];
    pics = data['pics'];
    novel_id = data['novel_id'];
    is_hot = data['is_hot'];
    add_time = data['add_time'];
    comment_num = data['comment_num'];
    like_num = data['like_num'];
    tags = data['tags'];
    user_author_id = data['user_author_id'];
    medal_url = data['medal_url'];

    pic = [];
    if (pics != null) {
      pics.forEach((data) {
        pic.add(PicInfo.fromJson(data));
      });
    }

    tag = [];
    if (tags != null) {
      tags.forEach((t) {
        tag.add(TagInfo.fromJson(t));
      });
    }
  }
}

class PicInfo {
  String path;
  String size;

  PicInfo.fromJson(Map data) {
    path = data['path'];
    size = data['size'];
  }
}

class TagInfo {
  String name;

  TagInfo.fromJson(Map data) {
    name = data['name'];
  }
}

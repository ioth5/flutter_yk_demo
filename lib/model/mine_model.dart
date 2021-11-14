class MineModel {
  String pic;
  String name;

  MineModel({this.pic, this.name});

  MineModel.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['name'] = this.name;
    return data;
  }
}

class MineTitle {
  String title;

  MineTitle({this.title});
}

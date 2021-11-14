import 'package:flutter/material.dart';
import 'package:yk_demo/public.dart';

class MeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 20, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/images/default_person_icon.png'),
                ),
                SizedBox(
                  width: 25.0,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '登录点击此处',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(height: 20),
            buildItems(),
          ],
        ),
      ),
    );
  }

  Widget buildItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildItem('--', '月票'),
        buildItem('--', '我的糖豆'),
        buildItem('--', '畅读卡'),
        Container(
          width: 71,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(
                    Constant.ASSETS_IMG + 'personal_chongzhi_background.png'),
                fit: BoxFit.fill),
          ),
          alignment: Alignment.center,
          child: TextButton(
            onPressed: null,
            child: Text(
              '充值',
              strutStyle:
                  StrutStyle(forceStrutHeight: true, height: -0.5, leading: 1),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItem(String title, String subtitle) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: SQColor.gray),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'home_model.dart';

class HomeMenu extends StatelessWidget {
  final List<MenuInfo> infos;

  HomeMenu(this.infos);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: infos.map((info) => menuItem(info)).toList(),
      ),
    );
  }

  Widget menuItem(MenuInfo info) {
    return Column(
      children: <Widget>[
        Container(
          width: 110,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            image:
                DecorationImage(image: AssetImage(info.icon), fit: BoxFit.fill),
          ),
          alignment: Alignment.center,
          child: TextButton(
            onPressed: null,
            child: Container(
              padding: EdgeInsets.only(right: 34),
              child: Text(
                info.title,
                strutStyle:
                    StrutStyle(forceStrutHeight: true, height: 1, leading: 1),
                style: TextStyle(
                  color: Color.fromRGBO(info.r, info.g, info.b, 1),
                ),
              ),
            ),
          ),
        ),
        // Image.asset(info.icon),
        // SizedBox(height: 5),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yk_demo/public.dart';

class SearchHotContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                Constant.ASSETS_IMG + 'hotsearch_1.png'),
                            fit: BoxFit.fill),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 150,
                      child: Text(
                        '斗罗大陆',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                Constant.ASSETS_IMG + 'hotsearch_other.png'),
                            fit: BoxFit.fill),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '4',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 150,
                      child: Text(
                        '秦时明月',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                Constant.ASSETS_IMG + 'hotsearch_2.png'),
                            fit: BoxFit.fill),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 150,
                      child: Text(
                        '你有糖果，我有乳牙',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                Constant.ASSETS_IMG + 'hotsearch_other.png'),
                            fit: BoxFit.fill),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '5',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 150,
                      child: Text(
                        '你和余生都归我',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                Constant.ASSETS_IMG + 'hotsearch_3.png'),
                            fit: BoxFit.fill),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 150,
                      child: Text(
                        '今天你吃糖了吗',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                Constant.ASSETS_IMG + 'hotsearch_other.png'),
                            fit: BoxFit.fill),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '6',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 150,
                      child: Text(
                        '十二月你好',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

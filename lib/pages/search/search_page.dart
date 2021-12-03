import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yk_demo/model/mine_model.dart';
import 'package:yk_demo/public.dart';

import 'package:yk_demo/pages/mine/me_header.dart';
import 'package:yk_demo/pages/mine/me_record.dart';
import 'package:yk_demo/util/toast.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[Text('11111')],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yk_demo/public.dart';

var indexPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

var bookshelfPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BookshelfPage();
});

var dispatchPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DispatchPage();
});

var CirclePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CirclePage();
});

var loginPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var settingPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingPage();
});

var novelDetailPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String novelid = params["novelid"]?.first;

  return NovelDetailScene(novelid);
});

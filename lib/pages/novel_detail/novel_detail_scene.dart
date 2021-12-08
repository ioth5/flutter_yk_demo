import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yk_demo/model/novel.dart';
import 'package:yk_demo/model/novel_comment.dart';
import 'package:dio/dio.dart';

import 'package:yk_demo/public.dart';
import 'package:yk_demo/util/styles.dart';
import 'package:yk_demo/util/toast.dart';

import 'novel_detail_header.dart';
import 'novel_summary_view.dart';
import 'novel_detail_toolbar.dart';
import 'novel_detail_recommend_view.dart';
import 'novel_detail_cell.dart';
import 'novel_comment_cell.dart';

class NovelDetailScene extends StatefulWidget {
  final String novelId;

  NovelDetailScene(this.novelId);

  @override
  NovelDetailSceneState createState() => NovelDetailSceneState();
}

class NovelDetailSceneState extends State<NovelDetailScene> with RouteAware {
  NovelInfo novelInfo;
  List<Novel> recommendNovels = [];
  List<NovelComment> comments = [];
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;
  bool isSummaryUnfold = false;
  int commentCount = 0;
  int commentMemberCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData();

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  changeSummaryMaxLines() {
    setState(() {
      isSummaryUnfold = !isSummaryUnfold;
    });
  }

  back() {
    Navigator.pop(context);
  }

  fetchData() async {
    try {
      var novelId = this.widget.novelId;

      FormData formData = FormData.fromMap(
          {"novel_id": novelId, "click_source": "index_recmd"});
      DioManager.getInstance().get(ServiceUrl.novelDetail, formData, (data) {
        var recommendResponse = data['data'];
        var novelInfo = recommendResponse['novel'];
        setState(() {
          this.novelInfo = NovelInfo.fromJson(novelInfo);
        });
      }, (error) {
        print("接口异常：" + error);
        // ToastUtil.show(error);
        setState(() {});
      });

      // var novelResponse = {
      //   "bid": "1945",
      //   "bookname": "逆天神医",
      //   "comment_count": "486547",
      //   "book_cover":
      //       "http://img-tailor.11222.cn/bcv/big/201901031812421599.jpg",
      //   "authorId": "2914205",
      //   "author_name": "月亮不发光",
      //   "hide": false,
      //   "shelfStatus": "1",
      //   "coverIsOpen": true,
      //   "readIsOpen": true,
      //   "stat_name": "完结",
      //   "listIsOpen": true,
      //   "wordCount": 437.29,
      //   "score": 4.9,
      //   "state": "1",
      //   "classId": "122",
      //   "class_name": "都市异能",
      //   "chapterNum": "2111",
      //   "lastInsTime": 1546697715,
      //   "payMode": "3",
      //   "price": "0.5",
      //   "first_article_id": 1000,
      //   "tag": ["神医", "医术", "都市生活"],
      //   "introduction":
      //       "【年度神作】真正的神医是什么？是会杀人的神医！\r\n杀一人，救百人，杀不杀？\r\n杀！\r\n这是一个不一样的神医；他妙手回春，有人将他的名字刻在长生牌位之上，日夜供奉。\r\n他受人唾骂，有人恨不得将他剥皮抽筋，日夜诅咒。\r\n他左擒济世壶，一手金针渡人苦海；他右持杀生剑，一剑送人断头台。\r\n可救人病，亦可要人命！\r\n",
      //   "firstChapter": {
      //     "id": 719306,
      //     "title": "第一章落魄青年",
      //     "updateTime": 1479970514,
      //     "shortContUrlSuffix": ""
      //   },
      //   "lastChapter": {
      //     "id": 1096632,
      //     "title": "第二千一百一十一章红尘仙劫（上）",
      //     "updateTime": 1546697715,
      //     "shortContUrlSuffix": ""
      //   },
      //   "disType": 3,
      //   "disInfo": {"isBuyAll": false, "minDiscount": "88"},
      //   "miguInfo": {},
      //   "extraDiscount": 10,
      //   "userMonthlyType": 3,
      //   "serverTime": 1546752139,
      //   "topClass": "502",
      //   "shareCoverUrl": "http://d.shuqi.com/1_5doSc",
      //   "formats": "1",
      //   "weekClick": "228232",
      //   "recIntro": "杀人即是救人，这么做到底是对是错，留给世人评说。一个神医的孤独之旅。",
      //   "similar": "91%",
      //   "intro": "",
      //   "superVipEndTime": 0,
      //   "isSupportVipCoupon": 1,
      //   "oriIsReward": true,
      //   "finalPrice": "",
      //   "audiobookInfo": {"playCount": "0", "cpIntro": ""},
      //   "relationBookId": 0,
      //   "relationTopclass": 0,
      //   "relationAudiobookId": 0,
      //   "recommendTicketNum": 6643,
      //   "monthTicketNum": 2325,
      //   "rewardNum": 211452,
      //   "rewardRank": 0,
      //   "recommendTicketRank": 0,
      //   "monthTicketRank": 3,
      //   "cpName": "原创版权",
      //   "cpId": "10091",
      //   "fullDirectInfo": {},
      //   "monthlyEnd": 0,
      //   "limitFreeEnd": 0,
      //   "isOriginBook": 2,
      //   "originalInfo": {},
      //   "shortContUrlPrefix":
      //       "http://content.shuqireader.com/sapi/chapter/contentshort/",
      //   "numClick": "228232",
      //   "readFeatureOpt": "0",
      //   "isBuy": false,
      //   "isReward": true,
      //   "isMonthlyBook": false,
      //   "isSupportRecommendTicket": true,
      //   "isSupportMonthTicket": true
      // };

      var commentsResponse = [
        {
          "mid": "a46b796c3b4911e8abbc6c92bf28e005",
          "textType": "0",
          "isJing": 1,
          "isTop": 1,
          "isAuthor": 0,
          "status": "online",
          "statusOrigin": 14,
          "bookName": "逆天神医",
          "authorName": "月亮不发光",
          "bookId": "6900908",
          "authorId": "2914205",
          "score": 5,
          "uid": "926636390",
          "nickName": "大爷",
          "userPhoto":
              "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX",
          "zanNum": "6358",
          "pubTime": "1523204811",
          "replyNum": "135",
          "rootUid": "0",
          "existShenReply": 1,
          "replyInfo": {
            "repliedNickName": "大爷",
            "mid": "746be2b047ce11e8abc06c92bf28e013",
            "text": "确实是换了作者的",
            "type": "2",
            "nickName": "书友953662548",
            "repliedText":
                "神思悠远，故事线拉的极长，但是却又合情合理。由远入深，从现代拉回修真世界，最为精彩的点莫过于这个了。追了那么久，之前觉得不怎么样，后面文笔爆发的简直妙，感觉像是换了个作者似的"
          },
          "summary": "",
          "text":
              "神思悠远，故事线拉的极长，但是却又合情合理。由远入深，从现代拉回修真世界，最为精彩的点莫过于这个了。追了那么久，之前觉得不怎么样，后面文笔爆发的简直妙，感觉像是换了个作者似的",
          "auditStatus": 0,
          "btype": "1"
        },
        {
          "mid": "39029be2851911e789c16c92bf28e013",
          "textType": "0",
          "isJing": 1,
          "isTop": 1,
          "isAuthor": 0,
          "status": "online",
          "statusOrigin": 14,
          "bookName": "逆天神医",
          "authorName": "月亮不发光",
          "bookId": "6900908",
          "authorId": "2914205",
          "score": 5,
          "uid": "755372373",
          "nickName": "三年后",
          "userPhoto":
              "http://wx.qlogo.cn/mmopen/ajNVdqHZLLBMatIicktRKPXG1Gs3qp7zhrEA08UBicuHz6cvyz1hR5gmuAL4yORdnOCyfGvzNChSic09P7fzwVMww/0",
          "zanNum": "9716",
          "pubTime": "1503172903",
          "replyNum": "93",
          "rootUid": "0",
          "existShenReply": 0,
          "replyInfo": {
            "repliedNickName": "三年后",
            "mid": "5a97c5e6854311e789c16c92bf28e013",
            "text": "一定，无论何时都不会恶意灌水，不求快，力求好",
            "type": "1",
            "nickName": "月亮不发光",
            "repliedText":
                "兄弟我一直在看你的书希望你尽量更新快点，书写的不错比其他人写的要好我看你的书已经冲了不少钱了希望给我一个好结局"
          },
          "summary": "",
          "text": "兄弟我一直在看你的书希望你尽量更新快点，书写的不错比其他人写的要好我看你的书已经冲了不少钱了希望给我一个好结局",
          "auditStatus": 0,
          "btype": "1"
        },
        {
          "mid": "b25e6f785edd11e789c16c92bf28e013",
          "textType": "0",
          "isJing": 1,
          "isTop": 0,
          "isAuthor": 0,
          "status": "online",
          "statusOrigin": 14,
          "bookName": "逆天神医",
          "authorName": "月亮不发光",
          "bookId": "6900908",
          "authorId": "2914205",
          "score": 0,
          "uid": "771969073",
          "nickName": "风雨同行",
          "userPhoto":
              "http://wx.qlogo.cn/mmopen/psrH80icCFB1YMSZpah4jtxjse5ia90cjYX0E05OFuZBqbxibtkH8RR4ibxwGRo3heV8IUXAkE34dpUoib7DMiatwjfkzz85tB5ITR/0",
          "zanNum": "8528",
          "pubTime": "1498969193",
          "replyNum": "65",
          "rootUid": "0",
          "existShenReply": 0,
          "replyInfo": {
            "repliedNickName": "书友 871256594",
            "mid": "a6430f9eefa811e7abc06c92bf28e013",
            "text": "是啊！你不服？",
            "type": "1",
            "nickName": "月亮不发光",
            "repliedText": "评论是刷的吧"
          },
          "summary": "",
          "text": "天哪，，，能不能一天更新五十章，我出3000元钱，像这么慢慢看，而且是精彩的时候没有了，人都要疯不。[d][d][d]",
          "auditStatus": 0,
          "btype": "1"
        }
      ];
      List<NovelComment> comments = [];
      commentsResponse.forEach((data) {
        comments.add(NovelComment.fromJson(data));
      });

      var recommendResponse = [
        {
          "author_name": "北城",
          "bookname": "超级女神的护花高手",
          "bookid": "7060196",
          "authorid": "93971",
          "book_cover":
              "http:\/\/img-tailor.11222.cn\/bcv\/big\/201801171631281432.jpg",
          "tags": "爽文,学生,异术超能",
          "category": "都市异能"
        },
        {
          "author_name": "雪染墨月",
          "bookname": "最强高手纵横花都",
          "bookid": "7686657",
          "authorid": "3916503",
          "book_cover":
              "http:\/\/img-tailor.11222.cn\/bcv\/big\/201806271920338052.jpg",
          "tags": "热血,爽文,暧昧",
          "category": "都市异能"
        },
        {
          "author_name": "随心动",
          "bookname": "怜天悯地",
          "bookid": "4036593",
          "authorid": "1961475",
          "book_cover":
              "http:\/\/img-tailor.11222.cn\/bcv\/middle\/2015032510134648.jpg",
          "tags": "热血,架空",
          "category": "奇幻修真"
        },
        {
          "author_name": "秦刑",
          "bookname": "狼蛛游戏",
          "bookid": "7525937",
          "authorid": "4009106",
          "book_cover":
              "http:\/\/img-tailor.11222.cn\/bcv\/big\/201806082121416525.jpg",
          "tags": "悬疑,惊魂,诡事",
          "category": "恐怖惊悚"
        },
        {
          "author_name": "任青",
          "bookname": "荒帝",
          "bookid": "4593988",
          "authorid": "119135",
          "book_cover":
              "http:\/\/img-tailor.11222.cn\/bcv\/big\/201606121613037034.jpg",
          "tags": "热血,重生,架空",
          "category": "东方玄幻"
        },
        {
          "author_name": "木头老爷",
          "bookname": "丹皇邪少",
          "bookid": "5348043",
          "authorid": "2771900",
          "book_cover":
              "http:\/\/img-tailor.11222.cn\/bcv\/big\/201603111536513382.jpg",
          "tags": "热血,争霸,美女",
          "category": "都市异能"
        },
        {
          "author_name": "微微鸿气",
          "bookname": "武霸神荒",
          "bookid": "4205467",
          "authorid": "40346",
          "book_cover":
              "http:\/\/img-tailor.11222.cn\/bcv\/big\/201702161516516965.jpg",
          "tags": "热血,传奇,修炼,架空",
          "category": "异界大陆"
        },
        {
          "author_name": "紅颜若雪",
          "bookname": "二哥修仙传",
          "bookid": "7796739",
          "authorid": "4141918",
          "book_cover":
              "http:\/\/img-tailor.11222.cn\/bcv\/big\/201809262114271722.jpg",
          "tags": "热血,爽文,升级",
          "category": "古典仙侠"
        }
      ];

      List<Novel> recommendNovels = [];
      recommendResponse.forEach((data) {
        recommendNovels.add(Novel.fromJson(data));
      });

      setState(() {
        // this.novel = Novel.fromJson(novelResponse);
        this.comments = comments;
        this.recommendNovels = recommendNovels;
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Container(
          width: 44,
          height: Screen.navigationBarHeight,
          padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
          child: GestureDetector(
              onTap: back,
              child: Image.asset(Constant.ASSETS_IMG + 'pub_back_gray.png')),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            decoration: BoxDecoration(
                color: SQColor.white, boxShadow: Styles.borderShadow),
            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            height: Screen.navigationBarHeight,
            child: Row(
              children: <Widget>[
                Container(
                  width: 44,
                  child: GestureDetector(
                      onTap: back,
                      child: Image.asset(
                          Constant.ASSETS_IMG + 'pub_back_gray.png')),
                ),
                Expanded(
                  child: Text(
                    novelInfo.title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(width: 44),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildComment() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: <Widget>[
                SizedBox(width: 15),
                Image.asset(Constant.ASSETS_IMG + 'home_tip.png'),
                Text('   书评区', style: TextStyle(fontSize: 16)),
                Expanded(child: Container()),
                Image.asset(
                    Constant.ASSETS_IMG + 'novel_detail_addcomment.png'),
                Text(
                  ' 写书评',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(253, 120, 150, 1),
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
          Divider(height: 1),
          Column(
            children:
                comments.map((comment) => NovelCommentCell(comment)).toList(),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                '查看全部评论（${novelInfo.view_number}条）',
                style: TextStyle(fontSize: 14, color: SQColor.gray),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTags() {
    var colors = [Color(0xFFF9A19F), Color(0xFF59DDB9), Color(0xFF7EB3E7)];
    var i = 0;
    var tagWidgets = novelInfo.tags.map((tag) {
      var color = colors[i % 3];
      var tagWidget = Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromARGB(99, color.red, color.green, color.blue),
              width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
        child: Text(tag, style: TextStyle(fontSize: 14, color: colors[i % 3])),
      );
      i++;
      return tagWidget;
    }).toList();
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      color: SQColor.white,
      child: Wrap(runSpacing: 10, spacing: 10, children: tagWidgets),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.novelInfo == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: SQColor.white,
          elevation: 0,
        ),
      );
    }
    return Scaffold(
      body: AnnotatedRegion(
        value: navAlpha > 0.5
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.only(top: 0),
                    children: <Widget>[
                      NovelDetailHeader(novelInfo),
                      NovelSummaryView(novelInfo?.desc, isSummaryUnfold,
                          changeSummaryMaxLines),
                      NovelDetailCell(
                        iconName: Constant.ASSETS_IMG + 'home_tip.png',
                        title: '  查看目录',
                        subtitle: '共${novelInfo.view_number}章',
                        attachedWidget: Text(novelInfo.is_end ? '已完结' : '未完结',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                      NovelDetailCell(
                        iconName: Constant.ASSETS_IMG + 'home_tip.png',
                        title: '  红包',
                        subtitle: '',
                        attachedWidget: Text('抢红包',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                      // buildTags(),
                      SizedBox(height: 10),
                      buildComment(),
                      SizedBox(height: 10),
                      NovelDetailRecommendView(recommendNovels),
                    ],
                  ),
                ),
                // NovelDetailToolbar(novel),
              ],
            ),
            buildNavigationBar(),
          ],
        ),
      ),
    );
  }
}

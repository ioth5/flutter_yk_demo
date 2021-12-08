import 'package:flutter/material.dart';

class NovelSummaryView extends StatelessWidget {
  final String summary;
  final bool isUnfold;
  final VoidCallback onPressed;

  NovelSummaryView(this.summary, this.isUnfold, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            Text(
              summary,
              // maxLines: isUnfold ? null : 3,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
            // Image.asset(Constant.ASSETS_IMG + 'detail_fold_bg.png'),
            // Image.asset(isUnfold
            //     ? Constant.ASSETS_IMG + 'detail_up.png'
            //     : Constant.ASSETS_IMG + 'detail_down.png'),
          ],
        ),
      ),
    );
  }
}

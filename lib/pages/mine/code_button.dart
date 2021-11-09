import 'package:flutter/material.dart';
import 'package:yk_demo/util/yk_color.dart';

class CodeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final int coldDownSeconds;

  CodeButton({this.onPressed, this.coldDownSeconds});

  @override
  Widget build(BuildContext context) {
    if (coldDownSeconds > 0) {
      return Container(
        width: 95.0,
        child: Center(
          child: Text(
            '${coldDownSeconds}s',
            style: TextStyle(fontSize: 14, color: SQColor.primary),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 95,
        child: Text('获取验证码',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: SQColor.primary)),
      ),
    );
  }
}

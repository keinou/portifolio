import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karc_pf/constants.dart';
import 'package:karc_pf/widgets/page_scaffold.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
        title: 'First Page',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hi,',
                style: TextStyle(color: Colors.white, fontSize: 70.sp),
              ),
              maxLines: 1,
            ),
            RichText(
                text: TextSpan(
                    text: 'I\'m ',
                    style: TextStyle(
                        fontFamily: 'Hasklig',
                        color: Colors.white,
                        fontSize: 70.sp),
                    children: [
                  TextSpan(text: "R", style: TextStyle(color: primaryColor)),
                  const TextSpan(text: "afael "),
                  TextSpan(text: "K", style: TextStyle(color: primaryColor)),
                  const TextSpan(text: "arczevski")
                ])),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 0, height: 120.0),
                DefaultTextStyle(
                  style: const TextStyle(
                      fontFamily: 'Hasklig',
                      fontSize: 30.0,
                      color: Colors.white60),
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    RotateAnimatedText('ADVPL'),
                    RotateAnimatedText('Flutter'),
                    RotateAnimatedText('Dart'),
                    RotateAnimatedText('C#'),
                    RotateAnimatedText('Qlik View'),
                    RotateAnimatedText('Qlik Sense'),
                    RotateAnimatedText('Git'),
                    RotateAnimatedText('CI/CD'),
                    RotateAnimatedText('Docker'),
                    RotateAnimatedText('Kubernetes'),
                  ]),
                ),
              ],
            )
          ],
        ));
  }
}

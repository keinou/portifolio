import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karc_pf/constants.dart';
import 'package:karc_pf/widgets/page_scaffold.dart';
import 'package:karc_pf/widgets/skill_widget.dart';

class SkillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
        title: '',
        body: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: '',
                            style: TextStyle(
                                fontFamily: 'Hasklig',
                                color: Colors.white,
                                fontSize: 40.sp),
                            children: [
                          TextSpan(
                              text: "S", style: TextStyle(color: primaryColor)),
                          const TextSpan(text: "kills & "),
                          TextSpan(
                              text: "E", style: TextStyle(color: primaryColor)),
                          const TextSpan(text: "xperience")
                        ])),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      width: 600,
                      child: const Text('''
Much of my development scope is on the back end, with C#, ADVPL, and Dart. I risk a little with the front end with Flutter, but also pointy things with html and css.

I'm focusing on devops development focusing on bringing applications, whether monolithic, legacy or modern to container, with scalability and high availability.
'''),
                    ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SkillWidget(skill: "ADVPL", percentual: 90),
                  SkillWidget(skill: "Flutter", percentual: 68),
                  SkillWidget(skill: "Dart", percentual: 75),
                  SkillWidget(skill: "C#", percentual: 50),
                  SkillWidget(skill: "Qlik View", percentual: 85),
                  SkillWidget(skill: "Qlik Sense", percentual: 85),
                  SkillWidget(skill: "Git", percentual: 90),
                  SkillWidget(skill: "CI/CD", percentual: 75),
                  SkillWidget(skill: "Docker", percentual: 70),
                  SkillWidget(skill: "Kubernetes", percentual: 60),
                ],
              ),
            )
          ],
        ));
  }
}

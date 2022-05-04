import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karc_pf/constants.dart';
import 'package:karc_pf/widgets/button_menu.dart';
import 'package:karc_pf/widgets/page_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();

  ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
        title: 'First Page',
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(
                              fontFamily: 'Hasklig',
                              color: Colors.white,
                              fontSize: 70.sp),
                          children: [
                        TextSpan(
                            text: "C", style: TextStyle(color: primaryColor)),
                        const TextSpan(text: "ontact "),
                        TextSpan(
                            text: "m", style: TextStyle(color: primaryColor)),
                        const TextSpan(text: "e")
                      ])),
                  const Text(
                      "I’m interested in freelance opportunities – especially ambitious or large projects."),
                  const Text(
                      "However, if you have other request or question, don’t hesitate to send a email."),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width /
                        (mobileDisplay ? 2.6 : 1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _name,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Name',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _email,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width /
                        (mobileDisplay ? 2.6 : 1),
                    child: TextField(
                      controller: _subject,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Subject',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width /
                        (mobileDisplay ? 2.6 : 1),
                    child: TextField(
                      controller: _message,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Message',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OnHoverButton(
                    builder: (isHovered) => Container(
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(18.0),
                          // ),
                          color: isHovered ? Colors.black87 : Colors.black12,
                          boxShadow: isHovered
                              ? [
                                  BoxShadow(
                                    color: primaryColor,
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 0),
                                  )
                                ]
                              : []),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black12,
                          minimumSize: const Size(270, 80),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        child: const Text(
                          "Send",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          launchUrl(Uri.parse(
                              "mailto:rkarcapps@gmail.com?subject=[FORM] - ${_subject.text}&body=${_message.text}"));
                        },
                      ),
                    ),
                  ),
                  const Text(
                    "This is only a intent!",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  )
                ],
              ),
            ),
            mobileDisplay ? Expanded(flex: 2, child: Container()) : Container()
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:karc_pf/pages/contact_page.dart';
import 'package:karc_pf/pages/home_page.dart';

Color primaryColor = Color.fromARGB(255, 0, 119, 6);

final availablePages = <String, WidgetBuilder>{
  'Home Page': (_) => HomePage(),
  'ContactMe Page': (_) => ContactPage(),
};

final List<PageDetails> pages = [
  PageDetails(
      "Home Page", (_) => HomePage(), FlutterRemix.home_2_fill, 0, () {}),
  PageDetails("ContactMe Page", (_) => ContactPage(),
      FlutterRemix.mail_send_fill, 1, () {})
];

class PageDetails {
  final String name;
  final WidgetBuilder widget;
  final IconData iconData;
  final int index;
  Function onPressed;

  PageDetails(
      this.name, this.widget, this.iconData, this.index, this.onPressed);
}

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karc_pf/constants.dart';
import 'package:karc_pf/widgets/button_menu.dart';
import 'package:url_launcher/url_launcher.dart';

// make this a `StateProvider` so we can change its value
final selectedPageNameProvider = StateProvider<String>((ref) {
  // default value
  return availablePages.keys.first;
});

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  // watch for state changes inside selectedPageNameProvider
  final selectedPageKey = ref.watch(selectedPageNameProvider.state).state;
  // return the WidgetBuilder using the key as index
  return availablePages[selectedPageKey]!;
});

// 1. extend from ConsumerWidget
class AppMenu extends ConsumerWidget {
  void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
    if (ref.read(selectedPageNameProvider.state).state != pageName) {
      ref.read(selectedPageNameProvider.state).state = pageName;
      // dismiss the drawer of the ancestor Scaffold if we have one
      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. watch the provider's state
    final selectedPageName = ref.watch(selectedPageNameProvider.state).state;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(255, 27, 28, 30),
            boxShadow: [
              BoxShadow(color: primaryColor, blurRadius: 5, spreadRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const CircleAvatar(
                    backgroundImage:
                        ExactAssetImage("assets/images/profile.png"),
                    minRadius: 10,
                    maxRadius: 70,
                  ),
                )),
            Expanded(
                flex: 5,
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    shrinkWrap: true,
                    children: [
                      for (var page in pages)
                        MenuButton(
                          icon: page.iconData,
                          index: page.index,
                          isSelected: page.name ==
                              ref.read(selectedPageNameProvider.state).state,
                          onPressed: () => _selectPage(context, ref, page.name),
                        )
                      // MenuButton(
                      //     icon: FlutterRemix.home_2_fill,
                      //     onPressed: () {},
                      //     index: 0),
                      // MenuButton(
                      //     icon: FlutterRemix.git_branch_fill,
                      //     onPressed: () {},
                      //     index: 0),
                      // MenuButton(
                      //     icon: FlutterRemix.mail_send_fill,
                      //     onPressed: () {},
                      //     index: 0),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.yellow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            _launchUrl("https://github.com/keinou/");
                          },
                          icon: const Icon(
                            FlutterRemix.github_fill,
                            color: Colors.grey,
                          )),
                      IconButton(
                          onPressed: () {
                            _launchUrl(
                                "https://www.linkedin.com/in/karczevski/");
                          },
                          icon: const Icon(FlutterRemix.linkedin_fill,
                              color: Colors.grey)),
                    ],
                  ),
                ))
            // for (var pageName in availablePages.keys)
            //   Padding(
            //     padding: const EdgeInsets.all(8),
            //     child: MenuButton(icon: Icons.home, onPressed: () {}, index: 0),
            //   )
            // PageListTile(
            //   // 3. pass the selectedPageName as an argument
            //   selectedPageName: selectedPageName,
            //   pageName: pageName,
            //   onPressed: () => _selectPage(context, ref, pageName),
            // ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile({
    Key? key,
    this.selectedPageName,
    required this.pageName,
    this.onPressed,
  }) : super(key: key);
  final String? selectedPageName;
  final String pageName;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return MenuButton(icon: Icons.home, onPressed: () {}, index: 0);
    // return ListTile(
    //   // show a check icon if the page is currently selected
    //   // note: we use Opacity to ensure that all tiles have a leading widget
    //   // and all the titles are left-aligned
    //   leading: Opacity(
    //     opacity: selectedPageName == pageName ? 1.0 : 0.0,
    //     child: Icon(Icons.check),
    //   ),
    //   title: Text(pageName),
    //   onTap: onPressed,
    // );
  }
}

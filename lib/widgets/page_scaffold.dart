import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    Key? key,
    required this.title,
    this.actions = const [],
    this.body,
    this.floatingActionButton,
  }) : super(key: key);
  final String title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      appBar: hasDrawer
          ? AppBar(
              // 3. add a non-null leading argument if we have a drawer
              leading: hasDrawer
                  ? IconButton(
                      icon: Icon(Icons.menu),
                      // 4. open the drawer if we have one
                      onPressed: hasDrawer
                          ? () => ancestorScaffold.openDrawer()
                          : null,
                    )
                  : null,
              // title: Text(title),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              actions: actions,
            )
          : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

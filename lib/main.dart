import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karc_pf/constants.dart';
import 'package:karc_pf/widgets/app_menu.dart';
import 'package:karc_pf/widgets/split_view.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  // await ScreenUtil.ensureScreenSize();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. watch selectedPageBuilderProvider
    final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
    return ScreenUtilInit(
      designSize: Size(1200, 915),
      builder: (_) => MaterialApp(
        title: "Rafael Karczevski",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Hasklig',
            colorScheme: ColorScheme.dark(primary: primaryColor)),
        // just return `FirstPage` for now. We'll change this later
        home: SplitView(
          menu: AppMenu(),
          content: selectedPageBuilder(context),
        ),
      ),
    );
  }
}

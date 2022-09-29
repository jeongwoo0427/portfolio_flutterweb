import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'constant/app_themes.dart';
import 'ui/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        builder: (context, widget) => ResponsiveWrapper.builder(ClampingScrollWrapper.builder(context, widget!),
                defaultScale: true,
                minWidth: 330,
                defaultName: MOBILE,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(330),
                  const ResponsiveBreakpoint.resize(480, name: MOBILE),
                  //const ResponsiveBreakpoint.resize(640, name: 'MOBILE_LARGE'),
                  const ResponsiveBreakpoint.resize(850, name: TABLET),
                  const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
                ]),

        themeMode: ThemeMode.light,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        home: const HomeScreen());
  }
}

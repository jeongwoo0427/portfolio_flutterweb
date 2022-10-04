import 'package:flutter/material.dart';
import 'package:portfolio/ui/screen/home/banner_page.dart';

import '../../widget/navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final banner1Key = GlobalKey();
  final banner2Key = GlobalKey();
  final banner3Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_circle_down_sharp),
        onPressed: () {
          Scrollable.ensureVisible(banner2Key.currentContext!, curve: Curves.decelerate, duration: Duration(milliseconds: 500));
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Listener(
                onPointerDown: (event) {
                  print('onPointerDown');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: [
                    BannerPage(
                      key: banner1Key,
                    ),
                    BannerPage(),
                    BannerPage(
                      key: banner2Key,
                    ),
                    BannerPage(),
                    BannerPage(
                      key: banner3Key,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: NavigationWidget(),
          ),
        ],
      ),
    );
  }
}

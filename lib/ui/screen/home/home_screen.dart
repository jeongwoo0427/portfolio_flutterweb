import 'package:flutter/material.dart';
import 'package:portfolio/ui/screen/home/banner_page.dart';
import 'package:portfolio/ui/screen/home/info_page.dart';
import 'package:portfolio/ui/screen/home/stacks_page.dart';

import '../../widget/navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  final banner1Key = GlobalKey();
  final banner2Key = GlobalKey();
  final banner3Key = GlobalKey();

  bool isBack = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset > 80) {
          isBack = true;
        } else {
          isBack = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_circle_down_sharp),
        onPressed: () {
          //Scrollable.ensureVisible(banner2Key.currentContext!, curve: Curves.decelerate, duration: Duration(milliseconds: 500));
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
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
                    InfoPage(),
                    StacksPage(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: NavigationWidget(
              showBackColor: isBack,
            ),
          ),
        ],
      ),
    );
  }
}

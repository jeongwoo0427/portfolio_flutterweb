import 'package:flutter/material.dart';
import 'package:portfolio/ui/screen/home/banner_page.dart';

import '../../widget/navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Listener(
          onPointerDown: (event) {
            print('onPointerDown');
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: const [
              NavigationWidget(),
              BannerPage()
            ],
          ),
        ),
      ),
    );
  }
}

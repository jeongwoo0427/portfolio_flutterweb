import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/constant/app_assets.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.home_banner),
              fit:ResponsiveWrapper.of(context).isLargerThan(TABLET)? BoxFit.fitWidth:BoxFit.cover)),
    );
  }
}

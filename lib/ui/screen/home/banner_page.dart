import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/constant/app_assets.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ResponsiveWrapper.of(context).isSmallerThan(TABLET)? 400:700,
      decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.linearToSrgbGamma(),
              image: AssetImage(AppAssets.home_banner),
              fit:BoxFit.cover)),
    );
  }
}

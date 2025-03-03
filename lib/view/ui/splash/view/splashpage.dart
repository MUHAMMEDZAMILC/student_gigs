import 'dart:async';

import 'package:flutter/material.dart';
import 'package:student_gigs/utils/constants/appconstants.dart';
import 'package:student_gigs/utils/constants/colors.dart';
import 'package:student_gigs/utils/helper/help_screensize.dart';
import 'package:student_gigs/utils/helper/pagenavigator.dart';
import 'package:student_gigs/view/components/apptext.dart';
import 'package:student_gigs/view/ui/home/view/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Screen.openAsNewPage(context, HomeScreen());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: ColorResources.primarycolor,
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: AppConstants.appname,
              weight: FontWeight.w500,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}

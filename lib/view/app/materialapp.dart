import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_gigs/view/ui/splash/view/splashpage.dart';

import '../../utils/theme/themedata.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:TemeData().deftheme ,
      home: SplashScreen(),
    );
  }
}
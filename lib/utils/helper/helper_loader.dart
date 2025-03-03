// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../view/components/apptext.dart';
import '../constants/colors.dart';
import '../theme/dimensions.dart';
import 'help_screensize.dart';

class CustomError extends StatelessWidget {
   CustomError({super.key,this.height,this.width,this.errortext});
  double? width,height;
  String? errortext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??40,
      child:  Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/errorbag.png',width: 100,height: 100,fit: BoxFit.cover,),
            gap,
            AppText(text: errortext??'',color: ColorResources.seccolor,weight: FontWeight.w500,letterspace: 0.6,)
          ],
        )
      ),
    );
  }
}
class PageEntryLoader extends StatelessWidget {
   PageEntryLoader({super.key,this.height,this.width,this.errortext});
  double? width,height;
  String? errortext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child:  SizedBox(
      height: height??40,
      child:  Center(
        child: CircularProgressIndicator()
      ),)
      ),
    );
  }
}
class CustomNotFound extends StatelessWidget {
   CustomNotFound({super.key,this.height,this.width,this.errortext});
  double? width,height;
  String? errortext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child:  Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/emptybag.png',width: 100,height: 100,fit: BoxFit.cover,),
            gap,
            AppText(text: 'Data Not Found',color: ColorResources.seccolor,weight: FontWeight.w500,letterspace: 0.6,)
          ],
        )
      ),
    );
  }
}
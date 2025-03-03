// ignore_for_file: must_be_immutable, deprecated_member_use


import 'package:flutter/material.dart';
import 'package:student_gigs/utils/extension/space_ext.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper/help_screensize.dart';
import 'apptext.dart';

class ApBtn extends StatelessWidget {
  ApBtn(
      {super.key,
      this.child,
      required this.onPressed,
      required this.isValid,
      this.btncolor,
      this.textcolor,
      this.buttonStyle,
      this.isLoading=false,
      this.height,this.width,this.isBorderradius=false});
  Widget? child;
  Color? btncolor, textcolor;
  Function() onPressed;
  ButtonStyle? buttonStyle;
  double? height,width;
  bool isValid,isLoading;
  bool? isBorderradius = false;
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
        width:width?? ScreenUtil.screenWidth,
        height: height ?? 50.78,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ElevatedButton(
              
                style: buttonStyle ??
                    ButtonStyle(
                      elevation: const WidgetStatePropertyAll(6),
                        padding:
                            const WidgetStatePropertyAll(EdgeInsets.zero),
                        backgroundColor: WidgetStatePropertyAll(
                            btncolor ?? ColorResources.primarycolor),
                        shadowColor:  WidgetStatePropertyAll(
                            ColorResources.TRANSPARENT),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                onPressed: onPressed,
                child: isLoading == false? child ??
                    AppText(
                      text: '',
                      color: textcolor ?? ColorResources.scaffoldcolor,
                      size: 17,
                      letterspace: 0.1,
                      weight: FontWeight.w600,
                    ):0.hBox),
            isValid == true
                ? 0.hBox
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          ColorResources.scaffoldcolor.withOpacity(0.5),
                        ),
                        shadowColor: const WidgetStatePropertyAll(
                            ColorResources.TRANSPARENT), shape:WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {},
                    child: AppText(text: '')),
            isLoading == false
                ? 0.hBox
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          ColorResources.primarycolor.withOpacity(0.3),
                        ),
                        shadowColor: const WidgetStatePropertyAll(
                            ColorResources.TRANSPARENT), shape:isBorderradius==false? WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )):null),
                    onPressed: () {},
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(color: ColorResources.scaffoldcolor,strokeCap: StrokeCap.round,)),),
          ],
        ));
  }
}


// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_gigs/utils/extension/space_ext.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper/help_screensize.dart';
import '../../utils/theme/dimensions.dart';
import 'apptext.dart';

// ignore: must_be_immutable
class ApDrpDwn extends StatelessWidget {
  ApDrpDwn(
      {super.key,
      required this.value,
      required this.list,
      this.label,
      this.hinttext,
      required this.onchange,
      this.itemtxtcolor,
      this.height,
      this.width,
      this.vcontentpadding,
      this.prefix,
      this.suffix,
      this.readonly,
      this.onTap,
      this.contentalign,
      this.filledcolor,
      this.hintStyle,
      this.textstyle,
      this.labelshow,this.digitsonly,this.multiline=1,this.isrequired=false});
  String? value;
  String? label, hinttext;
   void Function(dynamic value) onchange;
  List<String> list;
  Color? itemtxtcolor;
  TextStyle? textstyle, hintStyle;
  bool? readonly, labelshow,digitsonly,isrequired;
  Widget? suffix, prefix;
  double? height, width,vcontentpadding;
  int? multiline =1;
  Color? filledcolor;
  TextAlign? contentalign;

  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
                    height:height?? 50.78,
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
        border: Border.all(
                      color:ColorResources.textcolor.withOpacity(1), width: 0.42),
                    ),
                    child: DropdownButton(
                      
                      underline: 0.hBox,
                      padding: EdgeInsets.symmetric(horizontal:padding ),
                      borderRadius: BorderRadius.circular(10),
                      menuWidth: ScreenUtil.screenWidth!*0.7,
                      hint: AppText(text: hinttext??'',color: ColorResources.textcolor,
                      weight: FontWeight.w400,
                      size: 13,),
                      
                      isExpanded: true,
                      icon:suffix?? Icon(CupertinoIcons.chevron_down,size: 14,),
                      dropdownColor: ColorResources.scaffoldcolor,
                      value: value,
                      items: list.map((e) => DropdownMenuItem(value: e.toString(),child: AppText(text: e.toString(),color: itemtxtcolor??ColorResources.textcolor,maxline: 1,weight: FontWeight.w300,),)).toList(), onChanged:onchange,),
                  );
  }
}

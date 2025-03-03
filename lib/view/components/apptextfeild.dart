
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_gigs/utils/extension/space_ext.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper/help_screensize.dart';
import '../../utils/theme/dimensions.dart';

// ignore: must_be_immutable
class AppTextFeild extends StatelessWidget {
  AppTextFeild(
      {super.key,
      required this.controller,
      this.label,
      this.hinttext,
      this.isobsecure,
      this.type,
      this.height,
      this.width,
      this.vcontentpadding,
      this.prefix,
      this.suffix,
      this.readonly,
      this.onTap,
      this.onChanged,
      this.onvalidate,
      this.contentalign,
      this.borderstyle,
      this.filledcolor,
      this.hintStyle,
      this.textstyle,
      this.labelshow,this.digitsonly,this.multiline=1,this.isrequired=false});
  TextEditingController controller;
  String? label, hinttext;
  TextInputType? type;
  TextStyle? textstyle, hintStyle;
  bool? isobsecure, readonly, labelshow,digitsonly,isrequired;
  Widget? suffix, prefix;
  double? height, width,vcontentpadding;
  int? multiline =1;
  Color? filledcolor;
  TextAlign? contentalign;
  OutlineInputBorder? borderstyle;
  Function()? onTap;
  Function(String value)? onChanged;
  String? Function(String? value)? onvalidate;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
      height: multiline!=null?(50.78*multiline!): 50.78,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(
      //                 color:ColorResources.BLACK.withOpacity(1), width: 0.42),
      // ),
      child: Center(
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor:Colors.transparent,
      splashColor: Colors.transparent,
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  onTap: onTap,
                  onChanged: onChanged,
                  obscureText: isobsecure ?? false,
                  validator:onvalidate,
                  enableSuggestions: false,
                  scribbleEnabled: false,
                  controller: controller,
                  keyboardType: type ?? TextInputType.text,
                  readOnly: readonly ?? false,
                  maxLines: multiline!=1?multiline!*2:multiline,
                  style: textstyle ??
                      const TextStyle(
                
                        color: ColorResources.textcolor,
                        fontWeight: FontWeight.w300,
                          
                        // fontSize: 14,
                      ),
                   inputFormatters: digitsonly==true
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                  ]
                : [],
                  textAlign: contentalign ?? TextAlign.start,
                  decoration: InputDecoration(
                    suffixIconConstraints: BoxConstraints(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal:padding ,vertical:multiline!=null?0: vcontentpadding??0 ),
                      // filled: true,
                      // fillColor:
                      //     filledcolor ?? ColorResources.GREY5.withOpacity(0.25),
                      hintText: hinttext,
                      
                      prefixIcon: prefix,
                      suffixIcon:  suffix??0.hBox,

                      labelText: label,
                      labelStyle: const TextStyle(
                        color: ColorResources.textcolor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'
                      ),
                      hintStyle: hintStyle ??
                          const TextStyle(
                              color: ColorResources.textcolor,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              fontSize: 13,),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide( color:ColorResources.textcolor.withOpacity(1), width: 0.42) ,
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide( color:ColorResources.textcolor.withOpacity(1), width: 0.42) ,
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide( color:ColorResources.textcolor.withOpacity(1), width: 0.42) ,
                      ),
                     ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
